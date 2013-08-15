# Class: centos_fw
#
# This class ...
#
# Parameters:
#
# Actions:
#   - enable syncplugins in puppet
#   - Manage Apache service
#
# Requires:
#
# Sample Usage:
#
class centos_fw {

  file { "/etc/puppet/puppet.conf":
    backup => true,
    ensure => present,
    group => 'root',
    owner => 'root',
    source => "puppet:///modules/centos_fw/puppet.conf",
  }

  resources { "firewall":
    purge => true
  }

  Firewall {
    before  => Class['centos_fw::post'],
    require => Class['centos_fw::pre'],
  }

  class { ['centos_fw::pre', 'centos_fw::post']: }

  class { 'firewall': }
}
