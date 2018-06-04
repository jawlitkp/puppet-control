class profile::puppetserver::base {
  include r10k::mcollective
  class { 'r10k':
      remote => 'https://gmarone:71953396b7f2487df5787ed6370ffadf46f03d06@github.bedbath.com/DevelopOrg/puppet-control.git',
  }
}
