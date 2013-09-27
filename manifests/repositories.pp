class glexecwn::repositories (
  $emi_version = glexecwn::params::emi_version) {
  #
  # ensure that we get everything from EMI and not mix with EPEL unless we need
  # stuff from there
  #

  #  include 'emirepos::emi2repositories'
  $major_release = regsubst($::operatingsystemrelease, '^(\d+)\.\d+$', '\1')

  yumrepo { "EMI_${emi_version}_base":
    name     => "emi-${emi_version}-base",
    descr    => 'EMI - $basearch - base',
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/sl${major_release}/\$basearch/base",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/RPM-GPG-KEY-emi',
    enabled  => 1,
    priority => 40,
  }

  yumrepo { "EMI_${emi_version}_contribs":
    name     => "emi-${emi_version}-contribs",
    descr    => 'EMI - $basearch - contribs',
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/sl${major_release}/\$basearch/contribs",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/RPM-GPG-KEY-emi',
    enabled  => 1,
    priority => 40,
  }

  yumrepo { "EMI_${emi_version}_third-party":
    name     => "emi-${emi_version}-third-party",
    descr    => 'EMI - $basearch - third-party',
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/sl${major_release}/\$basearch/third-party",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/RPM-GPG-KEY-emi',
    enabled  => 1,
    priority => 40,
  }

  yumrepo { "EMI_${emi_version}_updates":
    name     => "emi-${emi_version}-updates",
    descr    => 'EMI - $basearch - updates',
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/sl${major_release}/\$basearch/updates",
    gpgcheck => 1,
    gpgkey   => 'http://emisoft.web.cern.ch/emisoft/dist/EMI/${emi_version}/RPM-GPG-KEY-emi',
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

