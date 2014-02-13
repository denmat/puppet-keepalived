class keepalived::install {

  $packages = hiera('keepalived_packages')

  create_resources(package, $packages)
}