# == Define dhclient::set
#
# wrapper define to include dhclient. This define is used to override params at node level.
# Refer to dhclient class documentation
#
define dhclient::set (
  $requests  = ''
) {

  class {'dhclient':
    requests  => $requests
  }

}
