puppet-users
============

Simple puppet class to manage users and groups from hieradata

## Examples

```
users:
  crazyone:
    ensure    : present
    name      : crazyone
    password  : '$1$zIC9Lo6A$xWy0VecoqCaTw0FhXDrkz/'
    uid       : 176543
    gid       : 2345
    groups    : badusers
    comment   : Crazy One
    home      : /users/crazyone
    shell     : /bin/false
    allowdupe : false
    managehome: true
    system    : false
    expiry    : '2013-12-31'
    
groups:
  badusers:
    ensure   : present
    gid      : 5432
    allowdupe: false
    system   : false
```
