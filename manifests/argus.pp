class glexecwn::argus (
  $argus_server    = $glexecwn::params::argus_server,
  $argus_port      = $glexecwn::params::argus_port,
  $user_white_list = $glexecwn::params::user_white_list) {
  file { '/etc/glexec.conf':
    ensure  => present,
    content => template('glexecwn/glexec.conf.erb'),
    owner   => 'root',
    group   => 'glexec',
    mode    => 0640,
  }

  file { '/etc/lcmaps/lcmaps-glexec.db':
    ensure  => present,
    content => template('glexecwn/lcmaps-glexec.db.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => 0640,
  }
}
