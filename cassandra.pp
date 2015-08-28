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
  source => '/vagrant/cassandra.yaml'
}

service { 'cassandra':
  name => 'cassandra',
  ensure => 'running',
  require => [ File['cassandra_yaml'], Package['java-1.7.0-openjdk'] ]
}

# yaml_setting { "cassandra_yaml_1":
#   target => '/etc/cassandra/conf/cassandra.yaml',
#   key => 'seed_providers/parameters/seeds',
#   value => '172.28.128.3',
#   require => File['/etc/cassandra/conf/cassandra.yaml']
# }

# yaml_setting { "cassandra_yaml_2":
#   target => '/etc/cassandra/conf/cassandra.yaml',
#   key => 'listen_address',
#   value => '',
#   require => File['/etc/cassandra/conf/cassandra.yaml']
# }

# yaml_setting { "cassandra_yaml_3":
#   target => '/etc/cassandra/conf/cassandra.yaml',
#   key => 'cluster_name',
#   value => 'Desilu',
#   require => File['/etc/cassandra/conf/cassandra.yaml']
# }
