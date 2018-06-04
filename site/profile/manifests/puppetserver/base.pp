class profile::puppetserver::base {
  include r10k::mcollective
  class { 'r10k':
      remote => 'https://github.com/jawlitkp/puppet-r10k.git',
  }
}
