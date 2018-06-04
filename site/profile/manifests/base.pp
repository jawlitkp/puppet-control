class profile::base {
  #include ntp
  class { 'ntp':
    servers => [ lookup('ntp_servers')],
  }
}

