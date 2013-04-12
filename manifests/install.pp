class glexecwn::install {
  notice('installing glExec WN')
  #if ($operatingsystemmajorrelease == 5){
  #  package {xerces-c:
  #    ensure => '2.7.0-8',
  #    require => Exec ['downgrade-xerces-c'],
  #  }
  #  exec {'downgrade-xerces-c':
  #    command => 'yum -y downgrade xerces-c-2.7.0-8',
  #    path    => ['/sbin', '/bin', '/usr/sbin', '/usr/bin'],
  #    unless  => 'rpm -qa | grep xerces-c-2.7.0-8',
  #  }
  #}
  package {dummydpm:
    ensure => present,
  }
  package {emi-wn:
    ensure => present,
  }   
  package {emi-glexec_wn:
    ensure => present,
  }
  exec {"glexecperms":
    command => '/bin/chgrp glexec /usr/sbin/glexec ; /bin/chmod 06111 /usr/sbin/glexec'
  }
  # setup environment for glExec WN
  include ('glexecwn::env')
  include ('glexecwn::site-env')

  notice('configuring VOs')
  #CHANGED BY ALOSSENT 20130322 DUE TO REFACTORING VOSUPPORT MODULE
  class {'vosupport':
    supported_vos => [atlas, cms, lhcb, alice, dteam, ops, 'vo.aleph.cern.ch', 'vo.delphi.cern.ch', 'vo.l3.cern.ch', 
        'vo.opal.cern.ch', ilc, 'envirogrids.vo.eu-egee.org', geant4, na48, unosat, 'vo.gear.cern.ch',
        'vo.sixt.cern.ch'], #prod.vo.eu-eela.eu: missing voms
    enable_mappings_for_service => 'ARGUS'
  }
  file {"/var/log/glexec":
    ensure => "directory",
    owner => "root",
    group => "root",
  }
  Class["glexecwn::repositories"]->Package["dummydpm","emi-wn","emi-glexec_wn"] -> Exec["glexecperms"] -> File["/var/log/glexec"] -> Class["vosupport","glexecwn::env","glexecwn::site-env"]
}
