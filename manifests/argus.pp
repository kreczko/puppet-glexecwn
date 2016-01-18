class glexecwn::argus (
  $argus_server    = $glexecwn::params::argus_server,
  $argus_port      = $glexecwn::params::argus_port,
  $user_white_list = $glexecwn::params::user_white_list,
  $template_glexec_conf = 'glexecwn/glexec.conf.erb',
  $template_lcmaps_db   = 'glexecwn/lcmaps-glexec.db.erb',
  $loglevel_glexec = 3,
  $loglevel_lcmaps = 1,
  $loglevel_lcas   = 1,
  $loglevel_debug  = 1, #this is for various debuf log levels in the config
  ) {
  file { '/etc/glexec.conf':
    ensure  => present,
    content => template($template_glexec_conf),
    owner   => 'root',
    group   => 'glexec',
    mode    => '0640',
  }

  file { '/etc/lcmaps/lcmaps-glexec.db':
    ensure  => present,
    content => template($template_lcmaps_db),
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
  }
}
