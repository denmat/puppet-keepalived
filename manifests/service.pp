class keepalived::service ($enable, $ensure) {

  service {$name: 
    enable => $enable,
    ensure => $ensure 
  }

}