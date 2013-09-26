class glexecwn::repositories {
  #
  # ensure that we get everything from EMI and not mix with EPEL unless we need
  # stuff from there
  #

  #  include 'emirepos::emi2repositories'

  yumrepo { 'EMI_3_base':
    name => 'EMI 3 base repository',
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/\$basearch/base",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/RPM-GPG-KEY-emi',
    enabled  => 1,
    priority => 40,
  }

  yumrepo { 'EMI_3_contribs':
    name => 'EMI 3 constribs repository',
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/\$basearch/contribs",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/RPM-GPG-KEY-emi',
    enabled  => 1,
    priority => 40,
  }

  yumrepo { 'EMI_3_third-party':
    name => 'EMI 3 third-party repository',
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/\$basearch/third-party",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/RPM-GPG-KEY-emi',
    enabled  => 1,
    priority => 40,
  }

  yumrepo { 'EMI_3_updates':
    name => 'EMI 3 updates repository',
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/3/sl6/\$basearch/updates",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/3/RPM-GPG-KEY-emi',
    enabled  => 1,
    priority => 40,
  }

  #
  # upgrade path conflicts
  #

  # conflict with voms-client3
  # package {voms-clients:
  #  ensure => absent,
  #}
}

