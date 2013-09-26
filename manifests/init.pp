class glexecwn (
  $supported_vos      = $glexecwn::params::supported_vos,
  $argus_server       = $glexecwn::params::argus_server,
  $argus_port         = $glexecwn::params::argus_port,
  $user_white_list    = $glexecwn::params::user_white_list,
  $gridenvfile        = $glexecwn::params::gridenvfile,
  $gridmapdir         = $glexecwn::params::gridmapdir,
  $grid_env_location  = $glexecwn::params::grid_env_location,
  $srm_path           = $glexecwn::params::srm_path,
  $site_name          = $glexecwn::params::site_name,
  $myproxy_server     = $glexecwn::params::myproxy_server,
  $lcg_location       = $glexecwn::params::lcg_location,
  $gt_proxy_mode      = $glexecwn::params::gt_proxy_mode,
  $glite_location     = $glexecwn::params::glite_location,
  $glite_location_var = $glexecwn::params::glite_location_var,
  $glite_env_set      = $glexecwn::params::glite_env_set,
  $glexec_location    = $glexecwn::params::glexec_location,) {
  case $::operatingsystem {
    RedHat, SLC, SL, Scientific : {
      require fetchcrl
      include('glexecwn::repositories')

      class { 'glexecwn::install': supported_vos => $supported_vos, }

      class { 'glexecwn::config':
        gridenvfile        => $gridenvfile,
        gridmapdir         => $gridmapdir,
        grid_env_location  => $grid_env_location,
        glite_env_set      => $glite_env_set,
        glite_location     => $glite_location,
        glite_location_var => $glite_location_var,
        glexec_location    => $glexec_location,
        gt_proxy_mode      => $gt_proxy_mode,
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
      include('glexecwn::wninfo')

      /* Class['glexecwn::repositories']->Package['dummydpm','emi-wn','emi-glexec_wn']
       * ->
       * Exec['glexecperms'] -> File['/var/log/glexec'] ->
       * Class['vosupport','glexecwn::env','glexecwn::site-env']
       */

      /*
       * Class['glexecwn::repositories'] -> Package['dummydpm'] ->
       * Class['emi_wn','emi_glexec_wn'] -> Exec['glexecperms'] ->
       * File['/var/log/glexec'] ->
       * Class['vosupport','glexecwn::env','glexecwn::site-env']
       */

      Class['glexecwn::repositories'] -> Class['emi_wn', 'emi_glexec_wn'] ->
      Exec['glexecperms'] -> File['/var/log/glexec'] -> Class['glexecwn::env']
    }
    default         : {
      # There is some fedora configuration present but I can't actually get it
      # to work.
    }
  }
}

