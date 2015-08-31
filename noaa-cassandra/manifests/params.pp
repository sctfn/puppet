class cassandra::params (
  $cluster_name = "cluster",
  $seeds = "",
  $listen_address = "",
  $rpc_address = "",
  $package_name = "dsc20",
  $java_version = "java-1.7.0-openjdk",
  $config_template = "/vagrant/puppet/noaa-cassandra/templates/cassandra.yaml.erb",
  $config_file = "/etc/cassandra/conf/cassandra.yaml"
) {
}
