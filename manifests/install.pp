class dhclient::install {
  
  package { 'isc-dhcp-common':
    ensure  => 'present',
  }->
  package {'isc-dhcp-client':
    ensure  => 'present',
  }
}
