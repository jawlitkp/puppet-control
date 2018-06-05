## site.pp ##
node 'puppetmom.bedbath.com' {
  notify { "Catalog applying on puppetmom.bedbath.com.................": }
  include profile::puppetserver::masterofmasters
  notify { "Catalog applied on puppetmom.bedbath.com.................": }
}
