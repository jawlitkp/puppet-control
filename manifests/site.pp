## site.pp ##
node default {
  notify { "This is from puppet-master-1": }
  include profile::base
  include profile::puppetserver::master
}
