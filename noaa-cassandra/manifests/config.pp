class cassandra::config (
  $cluster_name = "cluster",
  $seeds = "",
  $listen_address = "",
  $rpc_address = "",
  $config_template = "/vagrant/puppet/noaa-cassandra/templates/cassandra.yaml.erb",
  $config_file = "/etc/cassandra/conf/cassandra.yaml"
) {
  file { $config_file :
    ensure => present,
    owner => 'cassandra',
    group => 'cassandra',
    content => template($config_template),
    require => Package[$package_name]
  }
}
