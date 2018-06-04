class profile::base {
    class { '::jerakia': }
    jerakia::policy { 'default': }
}

