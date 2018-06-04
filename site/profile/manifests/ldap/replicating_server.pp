class profile::openldap::replicating_server {
  class { '::openldap::server':
    root_dn       => 'cn=admin,ou=data,o=auth',
    root_password => 'secret1',
    suffix        => 'o=auth',
    access        => [
      [
        {
          'attrs' => ['userPassword'],
        },
        [
          {
            'who'    => ['self'],
            'access' => '=xw',
          },
          {
            'who'    => ['anonymous'],
            'access' => 'auth',
          },
        ],
      ],
      [
        {
          'dn' => '*',
        },
        [
          {
            'who'    => ['dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth"'],
            'access' => 'manage',
          },
          {
            'who'    => ['self'],
            'access' => 'write',
          },
          {
            'who'    => ['users'],
            'access' => 'read',
          },
        ],
      ],
    ],
    indices       => [
      [['objectClass'], ['eq', 'pres']],
      [['ou', 'cn', 'mail', 'surname', 'givenname'], ['eq', 'pres', 'sub']],
    ],
    interfaces    => ["ldap://${::ipaddress}/"],
    syncrepl      => [
      {
        'rid'            => 1,
        'provider'       => 'ldap://192.168.20.111/',
        'searchbase'     => 'o=auth',
        'bindmethod'     => 'simple',
        'binddn'         => 'cn=replicator,ou=data,o=auth',
        'credentials'    => 'secret12',
        'logbase'        => 'cn=log',
        'logfilter'      => '(&(objectClass=auditWriteObject)(reqResult=0))',
        'schemachecking' => true,
        'type'           => 'refreshAndPersist',
        'retry'          => [[60, '+']],
        'syncdata'       => 'accesslog',
      },
    ],
    update_ref    => ['ldap://192.168.20.111/'],
  }
  ::openldap::server::schema { 'cosine':
    ensure => present,
  }
  ::openldap::server::schema { 'inetorgperson':
    ensure => present,
  }
  ::openldap::server::schema { 'nis':
    ensure  => present,
    require => ::Openldap::Server::Schema['cosine'],
  }
}
