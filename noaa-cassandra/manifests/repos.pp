class cassandra::repos inherits cassandra {
  yumrepo { 'datastax':
    name => 'datastax',
    ensure => 'present',
    baseurl => 'http://rpm.datastax.com/community',
    descr => 'DataStax Repo for Apache Cassandra',
    enabled => 1,
    gpgcheck => 0
  }
}
