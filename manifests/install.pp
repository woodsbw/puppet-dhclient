class dhclient::install {

  package {'dhcp3-client':
    ensure  => 'present';
  'dhcp3-common':
    ensure  => 'present';
  }
}
