yumrepo { 'datastax':
  name => 'datastax',
  ensure => 'present',
  baseurl => 'http://rpm.datastax.com/community',
  descr => 'DataStax Repo for Apache Cassandra',
  enabled => 1,
  gpgcheck => 0
}


package { "java-1.7.0-openjdk":
  ensure => "installed",
  allow_virtual => false
}

package { "dsc20":
  ensure => "installed",
  allow_virtual => false,
  require => Yumrepo['datastax']
}

file { 'cassandra_yaml':
  path => '/etc/cassandra/conf/cassandra.yaml',
  require => Package['dsc20'],
  ensure => 'file',
  owner => 'cassandra',
  group => 'cassandra',
  source => '/vagrant/puppet/cassandra.yaml'
}

service { 'cassandra':
  name => 'cassandra',
  ensure => 'running',
  require => [ File['cassandra_yaml'], Package['java-1.7.0-openjdk'] ]
}
