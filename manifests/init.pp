class glexecwn inherits glexecwn::params {
  case $::operatingsystem {
    RedHat,SLC,SL:   {
      require afs,fetchcrl
      include ('glexecwn::repositories')
      include ('glexecwn::install')
      include ('glexecwn::argus')
      include ('glexecwn::wninfo')
    }
    default: {
      # There is some fedora configuration present but I can't actually get it to work.
    }
  }
}

