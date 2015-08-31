class cassandra::packages inherits cassandra {
    package { [$java_version, $package_name] :
      ensure => installed,
      allow_virtual => false,
    }
}
