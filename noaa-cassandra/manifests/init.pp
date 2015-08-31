# == Class: cassandra
#
# Initialize a basic Cassandra setup. This module currently supports a
# single-datacenter cluster.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'cassandra':
#    cluster_name => "Bob",
#    seeds => "1.2.3.4,1.2.3.5",
#    listen_address => "192.168.1.1",
#  }
#
# === Authors
#
# Scott Fenton <sctfen@gmail.com>
#
class cassandra (
  $cluster_name = "cluster",
  $seeds = "",
  $listen_address = "",
  $rpc_address = "",
  $package_name = "dsc20",
  $java_version = "java-1.7.0-openjdk",
  $config_template = "/vagrant/puppet/noaa-cassandra/templates/cassandra.yaml.erb",
  $config_file = "/etc/cassandra/conf/cassandra.yaml"
) {

  class { 'cassandra::packages':
    package_name => $package_name,
    java_version => $java_version,
  }

  class { 'cassandra::config':
    cluster_name => $cluster_name,
    seeds => $seeds,
    listen_address => $listen_address,
    rpc_address => $rpc_address,
    config_template => $config_template,
    config_file => $config_file,
    require => Class['cassandra::packages']
  }
    
  class { 'cassandra::service':
    require => Class['cassandra::config']
  }

}
