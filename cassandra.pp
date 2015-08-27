# yumrepo { 'datastax':
#   name => 'datastax',
#   ensure => 'present',
#   baseurl => 'http://rpm.datastax.com/community',
#   descr => 'DataStax Repo for Apache Cassandra',
#   enabled => 1,
#   gpgcheck => 0
# }

class { 'cassandra::datastax_repo':
  before => Class['cassandra']
}

package { "java-1.7.0-openjdk":
  ensure => "installed",
  allow_virtual => false,
  before => Class['cassandra']
}


class { 'cassandra':
  cluster_name    => 'MyCassandraCluster',
  package_name    => 'dsc20',
  endpoint_snitch => 'GossipingPropertyFileSnitch',
  listen_address  => "${::ipaddress}",
  seeds           => '172.28.128.7'
}
