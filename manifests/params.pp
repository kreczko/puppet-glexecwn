class glexecwn::params {
  $user_white_list = hiera('user_white_list',' ')
  $argus_server = hiera('argus_server','localhost')
  $argus_port = hiera('argus_port','8154')
  $srm_path  = hiera('srm_path','/opt/d-cache/srm')
  $site_name = hiera('site_name','unset')
  $myproxy_server = hiera('myproxy_server','localhost')
  $lcg_location = hiera('lcg_location','/usr')
  $lcg_gfal_infosys = hiera('lcg_gfal_infosys','unset')
  $gt_proxy_mode = hiera('gt_proxy_mode','old')
  $grid_env_location = hiera('grid_env_location','/usr/libexec')
  $gridmapdir = hiera('gridmapdir','/etc/grid-security/gridmapdir')
  $glite_location_var = hiera('glite_location_var','/var')
  $glite_location = hiera('glite_location','/usr')
  $glite_env_set = hiera('glite_env_set',true)
  $glexec_location = hiera('glexec_location','/usr')
  $gridenvfile = hiera('gridenvfile','/etc/profile.d/grid-env.sh')
  $supported_vos = hiera('supported_vos',[atlas, cms, lhcb, alice, dteam, ops, 'vo.aleph.cern.ch', 'vo.delphi.cern.ch', 'vo.l3.cern.ch', 
        'vo.opal.cern.ch', ilc, 'envirogrids.vo.eu-egee.org', geant4, na48, unosat, 'vo.gear.cern.ch',
        'vo.sixt.cern.ch'])
  $emi_version        = hiera('emi_version', 2)
  $install_dummydpm   = hiera('install_dummydpm', true)
  
}
