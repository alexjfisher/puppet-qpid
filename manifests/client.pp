# == Class: qpid::client
#
# Handles Qpid client package installations and configuration
#
class qpid::client(
  $version                 = $qpid::client::params::version,
  $config_file             = $qpid::client::params::config_file,
  $log_level               = $qpid::client::params::log_level,
  $ssl                     = $qpid::client::params::ssl,
  $ssl_port                = $qpid::client::params::ssl_port,
  $ssl_cert_db             = $qpid::client::params::ssl_cert_db,
  $ssl_cert_password_file  = $qpid::client::params::ssl_cert_password_file,
  $ssl_cert_name           = $qpid::client::params::ssl_cert_name,
  $client_packages         = $qpid::client::params::client_packages,
) inherits qpid::client::params {

  include ::qpid::client::install
  include ::qpid::client::config

  Class['qpid::client::install'] ~> Class['qpid::client::config']

}
