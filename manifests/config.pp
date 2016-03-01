#
# configure the emi glexec enabled worker node
#
class glexecwn::config (
  $glexec_location    = $glexecwn::params::glexec_location,
  $glite_env_set      = $glexecwn::params::glite_env_set,
  $glite_location     = $glexecwn::params::glite_location,
  $glite_location_var = $glexecwn::params::glite_location_var,
  $gridenvfile        = $glexecwn::params::gridenvfile,
  $gridmapdir         = $glexecwn::params::gridmapdir,
  $grid_env_location  = $glexecwn::params::grid_env_location,
  $gt_proxy_mode      = $glexecwn::params::gt_proxy_mode,
  $myproxy_server     = $glexecwn::params::myproxy_server,
  $lcg_gfal_infosys   = $glexecwn::params::lcg_gfal_infosys,
  $lcg_location       = $glexecwn::params::lcg_location,
  $site_name          = $glexecwn::params::site_name,
  $srm_path           = $glexecwn::params::srm_path,
  $supported_vos      = $glexecwn::params::supported_vos,) {
  # for /etc/glexec.conf
  $loglevel_glexec      = $glexecwn::loglevel_glexec
  $loglevel_lcmaps      = $glexecwn::loglevel_lcmaps
  $loglevel_lcas        = $glexecwn::loglevel_lcas
  $loglevel_debug       = $glexecwn::loglevel_debug
  $template_glexec_conf = $glexecwn::template_glexec_conf
  $user_white_list      = $glexecwn::user_white_list

  # for /etc/lcmaps/lcmaps-glexec.db
  $argus_port           = $glexecwn::argus_port
  $argus_server         = $glexecwn::argus_server
  $template_lcmaps_db   = $glexecwn::template_lcmaps_db

  # setup environment for glExec WN
  include glexecwn::config::grid_env

  file { '/etc/glexec.conf':
    ensure  => present,
    content => template($template_glexec_conf),
    owner   => 'root',
    group   => 'glexec',
    mode    => '0640',
  }

  file { '/etc/lcmaps/lcmaps-glexec.db':
    ensure  => present,
    content => template($template_lcmaps_db),
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
  }

  file { '/var/log/glexec':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
  }

  # configure VOs if required
  if empty($supported_vos) == false {
    include glexecwn::config::vosupport
    File['/var/log/glexec'] -> Class['glexec::config::vosupport'] -> Class['glexecwn::env']
  } else {
    File['/var/log/glexec'] -> Class['glexecwn::config::grid_env']
  }

}
