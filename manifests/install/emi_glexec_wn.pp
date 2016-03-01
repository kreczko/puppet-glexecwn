class glexecwn::install::emi_glexec_wn {
  $glexec_wn_package = {
    2 => 'emi-glexec_wn',
    3 => 'glexec-wn',
  }
  $emi_version       = $glexecwn::emi_version
  $emi_glexec_wn     = $glexec_wn_package[$emi_version]

  package { $emi_glexec_wn: ensure => present, }
}
