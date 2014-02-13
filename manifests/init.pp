class keepalived {

  require keepalived::install
  require keepalived::config
  require keepalived::service

  Class['keepalived::install'] -> Class['keepalived::config'] -> Class['keepalived::service']

}