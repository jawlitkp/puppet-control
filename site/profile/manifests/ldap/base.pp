class { 'ldap::client':
  uri  => 'ldap://192.168.158.122',
  base => 'ou=data,o=auth',
}

#class profile::openldap::base {
#  class { 'openldap':
#    tls_cacertdir => '/etc/openldap/certs',
#  }
#  ::openldap::configuration { '/etc/skel/.ldaprc':
#    ensure => file,
#    owner  => 0,
#    group  => 0,
#    mode   => '0640',
#    base   => 'o=auth',
#    uri    => ['ldaps://192.168.20.111/'],
#  }
#  #::openldap::configuration['/etc/skel/.ldaprc'] -> User <||>
#  include ::openldap::client
#}
#class profile::openldap::base {
#  class { 'openldap::client':
#    base       => 'o=auth',
#    uri        => ['ldaps://192.168.20.111'],
#    tls_cacert => '/etc/ssl/certs/ca-certificates.crt',
#  }
#}

