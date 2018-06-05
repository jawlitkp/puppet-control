## site.pp ##
node 'puppetmom.bedbath.com' {
  notify { "Catalog applying on puppetmom.bedbath.com.................": }
  include profile::puppetserver::masterofmasters
  include profile::activemq
  notify { "Catalog applied on puppetmom.bedbath.com.................": }
}
