class glexecwn::install {

  include ('glexecwn::params')

  #
  # install and configure the emi glexec enabled worker node
  #
  package {dummydpm:
    ensure => present,
  }
  
  # install worker node software
  class {"emi_wn":}
  class {"emi_glexec_wn":}
  
  #
  file{'/usr/sbin/glexec':
    ensure => file,
    replace => false,
    mode => '6111',
    owner => 'root',
    group => 'glexec',
  }
  
  # setup environment for glExec WN
  include ('glexecwn::env')
  include ('glexecwn::site-env')

  # configure VOs
  class {'vosupport':
    supported_vos => $glexecwn::params::supported_vos, #prod.vo.eu-eela.eu: missing voms
    enable_mappings_for_service => 'ARGUS'
  }

  file {"/var/log/glexec":
    ensure => "directory",
    owner => "root",
    group => "root",
  }
  
  Class["glexecwn::repositories"] -> Package["dummydpm"] -> Class["emi_wn","emi_glexec_wn"] -> File["/usr/sbin/glexec"] -> File["/var/log/glexec"] -> Class["vosupport","glexecwn::env","glexecwn::site-env"]
}
