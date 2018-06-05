class activemq::server {

  package { 'puppet-release-repo':
    ensure => latest,
    provider => 'rpm',
    source   => 'http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm',
    before => Package[ "activemq" ]
  }

  package { 'activemq':
    ensure => latest,
    before => Service[ "activemq" ]
  }

  service { 'activemq':
    ensure => running,
    enable => true
  }

  file { '/etc/activemq/activemq.xml':
    ensure => present,
    source => 'puppet:///modules/activemq/activemq.xml',
    owner  => 'activemq',
    group  => 'activemq',
    mode   => '0640',
    notify => Service['activemq']
  }

  file { 'activemq-link':
    path    => '/usr/share/activemq/activemq-data',
    ensure  => link,
    target  => '/var/cache/activemq/data',
    require => Package[ "activemq" ],
    before  => Service[ "activemq" ]
  }
}
