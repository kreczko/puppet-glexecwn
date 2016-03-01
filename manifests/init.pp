class glexecwn (
  $argus_port           = $glexecwn::params::argus_port,
  $argus_server         = $glexecwn::params::argus_server,
  $emi_version          = $glexecwn::params::emi_version,
  $glexec_location      = $glexecwn::params::glexec_location,
  $glexec_permissions   = $glexecwn::params::glexec_permissions,
  $glite_env_set        = $glexecwn::params::glite_env_set,
  $glite_location       = $glexecwn::params::glite_location,
  $glite_location_var   = $glexecwn::params::glite_location_var,
  $gridenvfile          = $glexecwn::params::gridenvfile,
  $gridmapdir           = $glexecwn::params::gridmapdir,
  $grid_env_location    = $glexecwn::params::grid_env_location,
  $gt_proxy_mode        = $glexecwn::params::gt_proxy_mode,
  $install_dummydpm     = $glexecwn::params::install_dummydpm,
  $install_emi_wn       = $glexecwn::params::install_emi_wn,
  $install_repositories = $glexecwn::params::install_repositories,
  $myproxy_server       = $glexecwn::params::myproxy_server,
  $lcg_gfal_infosys     = $glexecwn::params::lcg_gfal_infosys,
  $lcg_location         = $glexecwn::params::lcg_location,
  $site_name            = $glexecwn::params::site_name,
  $srm_path             = $glexecwn::params::srm_path,
  $supported_vos        = $glexecwn::params::supported_vos,
  $user_white_list      = $glexecwn::params::user_white_list,
  $template_glexec_conf = $glexecwn::params::template_glexec_conf,
  $template_lcmaps_db   = $glexecwn::params::template_lcmaps_db,
  $loglevel_glexec      = $glexecwn::params::loglevel_glexec,
  $loglevel_lcmaps      = $glexecwn::params::loglevel_lcmaps,
  $loglevel_lcas        = $glexecwn::params::loglevel_lcas,
  # this is for various debuf log levels in the config
  $loglevel_debug       = $glexecwn::params::loglevel_debug,) inherits glexecwn::params {
  include ::fetchcrl

  if $install_repositories {
    class { 'glexecwn::repositories':
      ensure      => $emi_repos_ensure,
      emi_version => $emi_version,
    }
    Class['glexecwn::repositories'] -> Class['glexecwn::install']
  }

  class { 'glexecwn::install':
  }

  class { 'glexecwn::config':
  }

  Class['glexecwn::install'] -> Class['glexecwn::config']
}
