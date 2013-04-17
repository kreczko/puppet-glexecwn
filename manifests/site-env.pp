class glexecwn::site-env inherits glexecwn::params 
{
  concat::fragment{"site-env global": 
    target  => $gridenvfile,
    order   => '55',
    content => template('glexecwn/gridenv-site.sh.erb')
  }  
}
