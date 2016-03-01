class glexecwn::params {
  $argus_server       = hiera('glexecwn::argus_server', 'localhost')
  $argus_port         = hiera('glexecwn::argus_port', '8154')

  $emi_version        = hiera('glexecwn::emi_version', 3)

  $glexec_location    = hiera('glexecwn::glexec_location', '/usr')
  $glexec_permissions = hiera('glexecwn::glexec_permissions', '6111')

  $glite_env_set      = hiera('glexecwn::glite_env_set', true)
  $glite_location     = hiera('glexecwn::glite_location', '/usr')
  $glite_location_var = hiera('glexecwn::glite_location_var', '/var')

  $gridenvfile        = hiera('glexecwn::gridenvfile', '/etc/profile.d/grid-env.sh')
  $gridmapdir         = hiera('glexecwn::gridmapdir', '/etc/grid-security/gridmapdir')
  $grid_env_location  = hiera('glexecwn::grid_env_location', '/usr/libexec')

  $gt_proxy_mode      = hiera('glexecwn::gt_proxy_mode', 'old')

  $install_dummydpm   = hiera('glexecwn::install_dummydpm', true)
  $install_emi_wn     = hiera('glexecwn::install_emi_wn', true)

  $myproxy_server     = hiera('glexecwn::myproxy_server', 'localhost')

  $lcg_gfal_infosys   = hiera('glexecwn::lcg_gfal_infosys', 'unset')
  $lcg_location       = hiera('glexecwn::lcg_location', '/usr')

  $site_name          = hiera('glexecwn::site_name', 'unset')
  $srm_path           = hiera('glexecwn::srm_path', '/opt/d-cache/srm')
  $supported_vos      = hiera('glexecwn::supported_vos', [])
  # examples for supported vos:
  #  [
  #    'atlas',
  #    'cms',
  #    'lhcb',
  #    'alice',
  #    'dteam',
  #    'ops',
  #    'vo.aleph.cern.ch',
  #    'vo.delphi.cern.ch',
  #    'vo.l3.cern.ch',
  #    'vo.opal.cern.ch',
  #    'ilc',
  #    'envirogrids.vo.eu-egee.org',
  #    'geant4',
  #    'na48',
  #    'unosat',
  #    'vo.gear.cern.ch',
  #    'vo.sixt.cern.ch']


  $user_white_list    = hiera('user_white_list', ' ')

  $template_glexec_conf = 'glexecwn/glexec.conf.erb'
  $template_lcmaps_db   = 'glexecwn/lcmaps-glexec.db.erb'
  $loglevel_glexec      = 3
  $loglevel_lcmaps      = 1
  $loglevel_lcas        = 1
  # this is for various debuf log levels in the config
  $loglevel_debug       = 1
}
