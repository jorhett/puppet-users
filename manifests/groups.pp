# == Class: groups
#
# Simple module to create groups from hiera data
#
# === Parameters
#
# === Examples
#
#  class { 'groups': }
#
# Hiera
#
#groups:
#  staff:
#    ensure    : present
#    gid       : 20
#    allowdupe : false
#    system    : false
#
class users::groups {
  $defaults  = { ensure => present }
  $grouplist = hiera_hash('groups')
  create_resources( group, $grouplist, $defaults )
}
