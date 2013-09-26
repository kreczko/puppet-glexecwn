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
  # setup environment for glExec WN
  class { 'glexecwn::env':
    glexec_location    => $glexec_location,
    glite_env_set      => $glite_env_set,
    glite_location     => $glite_location,
    glite_location_var => $glite_location_var,
    gridenvfile        => $gridenvfile,
    gridmapdir         => $gridmapdir,
    grid_env_location  => $grid_env_location,
    gt_proxy_mode      => $gt_proxy_mode,
    myproxy_server     => $myproxy_server,
    lcg_gfal_infosys   => $lcg_gfal_infosys,
    lcg_location       => $lcg_location,
    site_name          => $site_name,
    srm_path           => $srm_path,
  }

  # configure VOs
  if empty($supported_vos) == false {
    class { 'vosupport':
      # prod.vo.eu-eela.eu: missing voms
      supported_vos               => $supported_vos,
      enable_mappings_for_service => 'ARGUS'
    }
  }

  file { '/var/log/glexec':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
  }
}