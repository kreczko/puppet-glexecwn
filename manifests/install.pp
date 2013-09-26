#
# install the emi glexec enabled worker node
#
class glexecwn::install (
  $supported_vos    = $glexecwn::params::supported_vos,
  $install_dummydpm = $glexecwn::params::install_dummydpm,
  $emi_version      = $glexecwn::params::emi_version,) {
  if $install_dummydpm == true {
    package { dummydpm: ensure => present, }
  }

  # install worker node software
  # according to
  # http://wiki.nikhef.nl/grid/GLExec_Argus_Quick_Installation_Guide
  # emi_wn is not needed
  #  class { 'emi_wn':
  #  }

  $glexec_wn_package = {
    2 => 'emi-glexec_wn',
    3 => 'glexec_wn',
  }

  class { 'emi_glexec_wn':
    emi_glexec_wn => $glexec_wn_package[$emi_version]
  }

  exec { 'glexecperms': command => '/bin/chgrp glexec /usr/sbin/glexec ; /bin/chmod 06111 /usr/sbin/glexec' 
    }

}
