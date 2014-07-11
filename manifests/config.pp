class dhclient::config {

  file {'/etc/dhcp3/dhclient.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('dhclient/etc/dhclient.conf.erb'),
  }
}
