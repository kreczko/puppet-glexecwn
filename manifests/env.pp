class glexecwn::env inherits glexecwn::params {

  concat{$gridenvfile:
    owner =>  'root',
    group =>  'root',
    mode  =>  '0755',
    warn => "# $gridenvfile is managed by Puppet env.pp.\n#Any changes in here will be overwritten",         
  }
  concat::fragment{"grid-env header": 
    target  => $gridenvfile,
    order   => '01',
    content => template('glexecwn/gridenvsh_header.erb')
  }
  concat::fragment{"grid-env footer": 
    target  => $gridenvfile,
    order   => '99',
    content => template('glexecwn/gridenvsh_footer.erb')
  }
  
  file {"/etc/profile.d/grid-env.csh":
    ensure => present,
    content => template("glexecwn/gridenvcsh.erb"),
    owner => "root",
    group => "root",
    mode => 0644,
  }  
}
  
