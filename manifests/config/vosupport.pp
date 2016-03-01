class glexecwn::config::vosupport {
  $supported_vos = $glexecwn::supported_vos

  class { 'vosupport':
    # prod.vo.eu-eela.eu: missing voms
    supported_vos               => $supported_vos,
    enable_mappings_for_service => 'ARGUS'
  }

}