class { 'cassandra::service':

  service { 'cassandra':
    name => 'cassandra',
    ensure => 'running'
  }
}
