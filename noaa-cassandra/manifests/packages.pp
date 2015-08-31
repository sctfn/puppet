class cassandra::packages (
  $package_name = "dsc20",
  $java_version = "java-1.7.0-openjdk",
) {
    package { [$java_version, $package_name] :
      ensure => installed,
      allow_virtual => false,
    }
}
