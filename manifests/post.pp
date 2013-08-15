class centos_fw::post {
  firewall { '999 reject all input':
    proto  => 'all',
    action => 'reject',
    reject => 'icmp-host-prohibited',
    before => undef,
  }
  firewall { '999 reject all forward':
    chain  => 'FORWARD',
    proto  => 'all',
    action => 'reject',
    reject => 'icmp-host-prohibited',
    before => undef,
  }
}
