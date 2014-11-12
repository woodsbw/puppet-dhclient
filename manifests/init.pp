# == Class dhclient
#
# This class manage dhclient installation and configuration. It configures /etc/dhcp3/dhclient.conf file.
# By default it adds in dhcp request this fields:
#
# - 'subnet-mask'
# - 'broadcast-address'
# - 'time-offset'
# - 'routers'
# - 'domain-name'
# - 'domain-name-servers'
# - 'domain-search'
# - 'host-name'
# - 'netbios-name-servers'
# - 'netbios-scope'
# - 'interface-mtu'
# - 'rfc3442-classless-static-routes'
# - 'ntp-servers'
#
# This configuration can be modified using requests parameter
#
# === Parameters
#
# [*requests*]
#  Hash used to override requests fields. This params should be an hash:
#  - hash keys are the fields
#  - hash values should be true|false to enable or disable field in request
#
# === Examples
#
# 1) Add dhclient with all default fields
#
#    dhclient::set { "dhclient": }
#
# 2) Add dhclient and delete domain-name field in request:
#
#    dhclient::set { "dhclient":
#      requests   => {
#       'domain-name' => false
#      }
#    }
#
class dhclient (
  $requests = ''
){

  $default_requests = {
    'subnet-mask'                     => true,
    'broadcast-address'               => true,
    'time-offset'                     => true,
    'routers'                         => true,
    'domain-name'                     => true,
    'domain-name-servers'             => true,
    'domain-search'                   => true,
    'host-name'                       => true,
    'dhcp6.name-servers '             => true,
    'dhcp6.domain-search'             => true,
    'netbios-name-servers'            => true,
    'netbios-scope'                   => true,
    'interface-mtu'                   => true,
    'rfc3442-classless-static-routes' => true,
    'ntp-servers'                     => true,
    'dhcp6.fqdn'                      => true,
    'dhcp6.sntp-servers'              => true,
  }

  $merged_requests = merge($default_requests,$requests)

  include dhclient::install
  include dhclient::config

  Class['dhclient::install'] ->
  Class['dhclient::config']

}
