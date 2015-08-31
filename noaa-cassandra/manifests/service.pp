class cassandra::service inherits cassandra {

  service { 'cassandra':
    name => 'cassandra',
    ensure => 'running'
  }
}
