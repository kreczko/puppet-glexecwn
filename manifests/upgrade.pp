class glexecwn::upgrade {
#  exec {voms-clients:
#    command => "/usr/bin/yum  -y remove voms-clients",
#  }
#  class {"glexecwn::install":
#    require => Exec[voms-clients],
#  }
}
