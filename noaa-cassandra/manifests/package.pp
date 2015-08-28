class cassandra::package {
  package { 'java-1.7.0-openjdk':
    ensure => installed
  }

  package { "dsc20":
    ensure => "installed",
    allow_virtual => false,
    require => Class['cassandra::repos']
  }
  
