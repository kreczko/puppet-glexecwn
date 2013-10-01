class glexecwn (
  $argus_port         = $glexecwn::params::argus_port,
  $argus_server       = $glexecwn::params::argus_server,
  $emi_version        = $glexecwn::params::emi_version,
  $glexec_location    = $glexecwn::params::glexec_location,
  $glexec_permissions = $glexecwn::params::glexec_permissions,
  $glite_env_set      = $glexecwn::params::glite_env_set,
  $glite_location     = $glexecwn::params::glite_location,
  $glite_location_var = $glexecwn::params::glite_location_var,
  $gridenvfile        = $glexecwn::params::gridenvfile,
  $gridmapdir         = $glexecwn::params::gridmapdir,
  $grid_env_location  = $glexecwn::params::grid_env_location,
  $gt_proxy_mode      = $glexecwn::params::gt_proxy_mode,
  $install_dummydpm   = $glexecwn::params::install_dummydpm,
  $install_emi_wn     = $glexecwn::params::install_emi_wn,
  $myproxy_server     = $glexecwn::params::myproxy_server,
  $lcg_gfal_infosys   = $glexecwn::params::lcg_gfal_infosys,
  $lcg_location       = $glexecwn::params::lcg_location,
  $site_name          = $glexecwn::params::site_name,
  $srm_path           = $glexecwn::params::srm_path,
  $supported_vos      = $glexecwn::params::supported_vos,
  $user_white_list    = $glexecwn::params::user_white_list,) {
  case $::operatingsystem {
    RedHat, SLC, SL, Scientific : {
      require fetchcrl

      class { 'glexecwn::repositories': emi_version => $emi_version, }

      class { 'glexecwn::install':
        emi_version        => $emi_version,
        glexec_permissions => $glexec_permissions,
        install_dummydpm   => $install_dummydpm,
        install_emi_wn     => $install_emi_wn,
        supported_vos      => $supported_vos,
      }

      class { 'glexecwn::config':
        gridenvfile        => $gridenvfile,
        gridmapdir         => $gridmapdir,
        grid_env_location  => $grid_env_location,
        glite_env_set      => $glite_env_set,
        glite_location     => $glite_location,
        glite_location_var => $glite_location_var,
        glexec_location    => $glexec_location,
        gt_proxy_mode      => $gt_proxy_mode,
        lcg_gfal_infosys   => $lcg_gfal_infosys,
        lcg_location       => $lcg_location,
        myproxy_server     => $myproxy_server,
        site_name          => $site_name,
        srm_path           => $srm_path,
      }

      class { 'glexecwn::argus':
        argus_server    => $argus_server,
        argus_port      => $argus_port,
        user_white_list => $user_white_list,
      }

      class { 'glexecwn::wninfo':
      }

      Class['glexecwn::repositories'] -> Class['glexecwn::install'] -> Class['glexecwn::config'
        ]
    }
    default                     : {
      # There is some fedora configuration present but I can't actually get it
      # to work.
    }
  }
}
