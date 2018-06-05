class profile::puppetserver::base {
  include r10k::mcollective
  class { 'r10k':
      remote => 'https://github.com/jawlitkp/puppet-control.git',
  }
  class  { 'activemq': }
  class { 'mcollective':
    middleware_hosts          => [ 'puppetmom.beabath.com' ],
    middleware_user           => 'system',
    middleware_password       => 'manager',
    client                    => true,
  }



}
