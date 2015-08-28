class cassandra::java {
  package { 'java-1.7.0-openjdk':
    ensure => installed
  }
}
