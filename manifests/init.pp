# == Class: users
#
# Simple module to create users from hiera data
#
# === Parameters
#
# [*managehomedir*]
#   'latest' (default) or a specific version of an agent
#
# === Examples
#
#  class { 'users':
#    managehomedir => true,
#  }
#
# Hiera data
#
#users:
#  jorhett:
#    ensure    : present
#    name      : jorhett
#    password  : '$1$zIC9Lo6A$xWy0VecoqCaTw0FhXDrkz/'
#    uid       : 176543
#    gid       : 2345
#    groups    : wheel,staff,admins
#    comment   : Jo Rhett
#    home      : /users/jorhett
#    shell     : /bin/false
#    allowdupe : false
#    managehome: true
#    system    : false
#    expiry    : '2013-12-31'
#
class users(
  $managehomedir = true,
) {
  include users::groups

  $defaults      = { ensure => present, managehome => $managehomedir }
  $userlist      = hiera_hash('users')
  create_resources( user, $userlist, $defaults )
}
