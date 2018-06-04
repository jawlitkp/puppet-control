## site.pp ##
node default {
  notify { "This is from puppet-master-1": }
}
# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
#https://docs.puppet.com/pe/2015.3/release_notes.html#filebucket-resource-no-longer-created-by-default
# File { backup => false }
#
# # DEFAULT NODE
# # Node definitions in this file are merged with node data from the console. See
# # http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# # node definitions.
#
# # The default node definition matches any node lacking a more specific node
# # definition. If there are no other nodes in this file, classes declared here
# # will be included in every node's catalog, *in addition* to any classes
# # specified in the console for that node.
# #config_version = '/usr/bin/git --git-dir $confdir/environments/$environment/.git rev-parse HEAD'
# #case $::network {
# #  /^(192\.168\.2[0-2]\.[0-255])$/ : {
# #    $environment = "corp"
# #  }
# #  /^(192\.168\.158\.[0-255])$/ : {
# #    $environment = "corp"
# #  }
# #  /^(10\.161\.3[2-4].[0-255])$/ : {
# #    $environment = "production"
# #  }
# #  default: {
# #    $environment = "blarg"
# #  }
# #}
#
# node /^puppetserver.bedbath.it$/ {
#   include profile::base
# #  include profile::puppetserver::master
# }
#
# node 'gcp-puppet-agent-1' {
#   include profile::base
# #  include profile::puppetserver::master
# }
#
# node 'puppetclient.bedbath.it' {
#   include profile::base
# #  include profile::puppetserver::master
# }
#
# node 'gcp-puppet-agent-1.c.production-project-195021.internal' {
#   include profile::base
# #  include profile::puppetserver::master
# }
# node 'njun-corp01-ops-test-01.bedbath.it' {
#   include profile::base
#   include profile::jenkins::master
# }
#
# node 'njun-corp01-ops-build-01.bedbath.it' {
#   include profile::base
# }
#
# node 'njundvfftfeo11.bedbath.com' {
#   include profile::base
#   #include profile::puppetserver::master
#   #include profile::jenkins::master
#   include profile::openldap::base
#   include profile::openldap::server
# }
