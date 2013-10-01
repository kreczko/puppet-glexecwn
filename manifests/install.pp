#
# install the emi glexec enabled worker node
#
class glexecwn::install (
  $supported_vos      = $glexecwn::params::supported_vos,
  $install_dummydpm   = $glexecwn::params::install_dummydpm,
  $install_emi_wn     = $glexecwn::params::install_emi_wn,
  $glexec_permissions = $glexecwn::params::glexec_permissions,
  $emi_version        = $glexecwn::params::emi_version,) {
  if $install_dummydpm == true {
    package { dummydpm: ensure => present, }
  }

  # install worker node software
  # according to
  # http://wiki.nikhef.nl/grid/GLExec_Argus_Quick_Installation_Guide
  # emi_wn is not needed
  if $install_emi_wn == true {
    class { 'emi_wn': }
  }

  $glexec_wn_package = {
    2 => 'emi-glexec_wn',
    3 => 'glexec-wn',
  }

  class { 'emi_glexec_wn':
    emi_glexec_wn => $glexec_wn_package[$emi_version]
  }

  file { '/usr/sbin/glexec':
    ensure => present,
    group  => 'glexec',
    mode   => $glexec_permissions,
  }

  if $install_emi_wn == true {
    Class['emi_glexec_wn'] -> File['/usr/sbin/glexec']
  } else {
    Class['emi_wn'] -> Class['emi_glexec_wn'] -> File['/usr/sbin/glexec']
  }
}
