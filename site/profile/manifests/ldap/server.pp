class { 'ldap::server':
  suffix  => 'o=auth',
  rootdn  => 'cn=admin,ou=data,o=auth',
  rootpw  => 'secret1',
}


#class profile::openldap::server {
#  class { '::openldap::server':
#    root_dn       => 'cn=admin,ou=data,o=auth',
#    root_password => 'secret1',
#    suffix        => 'o=auth',
#    access        => [
#      [
#        {
#          'attrs' => ['userPassword'],
#        },
#        [
#          {
#            'who'    => ['self'],
#            'access' => '=xw',
#          },
#          {
#            'who'    => ['anonymous'],
#            'access' => 'auth',
#          },
#        ],
#      ],
#      [
#        {
#          'dn' => '*',
#        },
#        [
#          {
#            'who'    => ['dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth"'],
#            'access' => 'manage',
#          },
#          {
#            'who'    => ['self'],
#            'access' => 'write',
#          },
#          {
#            'who'    => ['users'],
#            'access' => 'read',
#          },
#        ],
#      ],
#    ],
#    accesslog     => true,
#    indices       => [
#      [['objectClass'], ['eq', 'pres']],
#      [['ou', 'cn', 'mail', 'surname', 'givenname'], ['eq', 'pres', 'sub']],
#    ],
#    interfaces    => ["ldap://${::ipaddress}/"],
#    replica_dn    => ['cn=replicator,ou=data,o=auth'],
#    syncprov      => true,
#  }
#  ::openldap::server::schema { 'cosine':
#    ensure => present,
#  }
#  ::openldap::server::schema { 'inetorgperson':
#    ensure => present,
#  }
#  ::openldap::server::schema { 'nis':
#    ensure  => present,
#    require => ::Openldap::Server::Schema['cosine'],
#  }
#}
#class profile::openldap::server {
#  $ensure    = present
#  $directory = '/var/lib/ldap/auth.bedbath.com'
#  $rootdn    = 'cn=admin,o=auth'
#  $rootpw    = 'secret1'
#  $dn        = 'o=auth'
#
#  class { 'openldap::server':
#    provider => 'olc',
#  }
#  openldap::server::database { $dn:
#    provider => 'olc',
#    ensure => present,
#    rootdn => "cn=admin,${dn}",
#    rootpw => $rootpw,
#  }
#  openldap::server::globalconf { 'ServerID':
#    ensure  => present,
#    value   => { 'ServerID' => [ '1 ldaps://192.168.20.111', '2 ldaps://192.168.20.112' ] }
#  } 
#  class { 'openldap::server':
#    databases => {
#      'o=auth' => {
#        directory => '/var/lib/ldap/auth.bedbath.com',
#        rootdn    => 'cn=admin,o=auth',
#        rootpw    => 'secret1',
#      },
#      'dc=bedbath,dc=it' => {
#        directory => '/var/lib/ldap/bedbath.it',
#        rootdn    => 'cn=admin,dc=bedbath,dc=it',
#        rootpw    => 'secret1',
#      },
#    },
#  }
#
#    openldap::server::module { 'memberof':
#      ensure => present,
#    }
#    openldap::server::overlay { 'memberof on ou=ServiceAccounts,ou=services,o=auth':
#      ensure => present,
#    }
#    openldap::server::overlay { 'memberof on ou=Employees,ou=Users,ou=data,o=auth':
#      ensure => present,
#    }
#    openldap::server::access { '{0}to attrs=userPassword,shadowLastChange by dn="cn=admin,o=auth" write by anonymous auth on o=auth' : }
#}
