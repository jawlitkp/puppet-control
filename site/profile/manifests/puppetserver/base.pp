class profile::puppetserver::base {
  include r10k::mcollective
  class { 'r10k':
      remote => 'https://github.com/jawlitkp/puppet-control.git',
  }
  class  { 'activemq': }
  class { '::mcollective':
    middleware_hosts          => [ 'puppetmom.beabath.com' ],
    middleware_user           => 'system',
    middleware_password       => 'manager',
    client                    => true,
  }
  class { '::consul':
    config_hash => {
      'bootstrap_expect' => 1,
      'client_addr'      => '0.0.0.0',
      'data_dir'         => '/opt/consul',
      'datacenter'       => 'east-aws',
      'log_level'        => 'INFO',
      'node_name'        => 'server',
      'server'           => true,
      'ui'               => true,
    }
  }

}
