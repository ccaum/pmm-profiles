class profile::network::cisco::interfaces {
  cisco_interface { 'Ethernet1/1' :
    shutdown            => true,
    switchport_mode     => disabled,
    description         => 'managed by puppet',
    ipv4_address        => '192.168.55.55',
    ipv4_netmask_length => 24,
    vrf                 => 'test',
  }

  cisco_interface { 'Ethernet1/2':
    description     => 'default',
    shutdown        => 'default',
    access_vlan     => 'default',
    switchport_mode => access,
  }

  cisco_interface { 'Ethernet1/3':
    switchport_mode               => trunk,
  }

  cisco_interface { 'Vlan22':
    svi_autostate  => false,
    svi_management => true,
  }
}
