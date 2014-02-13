class keepalived::config {

  require 'keepalived::install'
  $keepalived_support_scripts = hiera('keepalived_support_scripts')
  $keepalived_vrrp_config = hiera('vrrp_config')
  

  $keepalived_template = $keepalived_vrrp_config[config_template]
  $keepalived_check_scripts = $keepalived_vrrp_config[vrrp_check_script]
  $keepalived_groups = $keepalived_vrrp_config[vrrp_group]

 
  file { '/etc/keepalived/keepalived.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 0640,
    content => template($keepalived_template),
  }
}