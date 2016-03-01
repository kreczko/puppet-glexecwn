#
# install the emi glexec enabled worker node
#
class glexecwn::install {
  $glexec_permissions = $glexecwn::glexec_permissions
  $install_dummydpm   = $glexecwn::install_dummydpm
  $install_emi_wn     = $glexecwn::install_emi_wn

  if $install_dummydpm == true {
    package { 'dummydpm': ensure => present, }
  }

  # install worker node software
  include ::glexecwn::install::emi_glexec_wn

  # according to
  # http://wiki.nikhef.nl/grid/GLExec_Argus_Quick_Installation_Guide
  # emi_wn is not needed
  if $install_emi_wn == true {
    include ::glexecwn::install::emi_wn
    Class['glexecwn::install::emi_glexec_wn'] -> File['/usr/sbin/glexec']
  } else {
    Class['glexecwn::install::emi_wn'] -> Class['glexecwn::install::emi_glexec_wn'] -> File['/usr/sbin/glexec']
  }

  file { '/usr/sbin/glexec':
    ensure => present,
    group  => 'glexec',
    mode   => $glexec_permissions,
  }
}
