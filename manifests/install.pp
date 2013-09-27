class glexecwn::install {

  #
  # install and configure the emi glexec enabled worker node
  #
  package {dummydpm:
    ensure => present,
  }
  
  # install worker node software
  class {'emi_wn':}
  class {'emi_glexec_wn':}
  
  exec {'glexecperms':
    command => '/bin/chgrp glexec /usr/sbin/glexec ; /bin/chmod 06111 /usr/sbin/glexec'
  }

  # setup environment for glExec WN
  include ('glexecwn::env')
  include ('glexecwn::site_env')

  # configure VOs
  class {'vosupport':
    supported_vos => $supported_vos, #prod.vo.eu-eela.eu: missing voms
    enable_mappings_for_service => 'ARGUS'
  }

  file {'/var/log/glexec':
    ensure => 'directory',
    owner => 'root',
    group => 'root',
  }
  
#  Class['glexecwn::repositories']->Package['dummydpm','emi-wn','emi-glexec_wn'] -> Exec['glexecperms'] -> File['/var/log/glexec'] -> Class['vosupport','glexecwn::env','glexecwn::site-env']
  Class['glexecwn::repositories'] -> Package['dummydpm'] -> Class['emi_wn','emi_glexec_wn'] -> Exec['glexecperms'] -> File['/var/log/glexec'] -> Class['vosupport','glexecwn::env','glexecwn::site_env']
}
