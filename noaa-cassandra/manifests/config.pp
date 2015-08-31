class cassandra::config inherits cassandra {
    
  file { $config_file :
    ensure => present,
    owner => 'cassandra',
    group => 'cassandra',
    content => template($config_template),
    require => Package[$package_name]
  }
}
