class glexecwn::repositories {
  
  #
  # ensure that we get everything from EMI and not mix with EPEL unless we need stuff from there
  #
  
  include "emirepos::emi3repositories"
  
  #
  # upgrade path conflicts
  #

  # conflict with voms-client3
  #package {voms-clients:
  #  ensure => absent,
  #}

}
  

