class profile::network::base {
  require ciscopuppet::install
  include profile::network::base::snmp

  service { 'puppet':
    ensure => running,
    enable => true,
  }
}
