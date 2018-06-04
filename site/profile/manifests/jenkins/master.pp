## now you can access
##   access https://jenkins.hacklab:8081

class profile::jenkins::master (
  String $jenkins_port = '9091',
  String $java_dist    = 'jdk',
  String $java_version = 'latest',
) {

  class { 'java':
    distribution => $java_dist,
    version      => $java_version,
    before       => Class['jenkins'],
  }
  java_ks { 'jenkins_keystore_base':
    ensure       => latest,
    certificate  => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
    target       => '/opt/jenkins.ks',
    password     => 'puppet',
    trustcacerts => true,
  }
  
  java_ks { 'jenkins_keystore_certs':
    ensure              => latest,
    certificate         => "/etc/puppetlabs/puppet/ssl/certs/%{fqdn}.pem",
    private_key         => '/etc/puppetlabs/puppet/ssl/private_keys/%{fqdn}.pem',
    private_key_type    => 'rsa',
    target              => '/opt/jenkins.ks',
    password            => 'puppet',
    password_fail_reset => true,
  }
  
  class { 'jenkins':
    enable_https            => true,
    http_listen_address     => '192.168.158.138',
    https_listen_address    => '192.168.158.138',
    http_port               => 8080,
    https_port              => 8443,
    https_keystore          => '/opt/jenkins.ks',
    https_keystore_password => 'puppet',
  }

}

