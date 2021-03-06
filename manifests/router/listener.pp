# == Define: qpid::router::listener
#
# Configure a qpid router listener
#
# == Parameters
#
# $ssl_profile::    SSL profile to use
#
# $addr::           Address to listen on
#
# $port::           Port to listen on
#
# $sasl_mech::      SASL mechanism to use
#
# $role::           Listener role
#
# $idle_timeout::   Timeout in seconds
#
define qpid::router::listener(
  $ssl_profile    = undef,
  $addr           = '0.0.0.0',
  $port           = 5672,
  $sasl_mech      = 'ANONYMOUS',
  $role           = undef,
  $idle_timeout   = undef,
){

  concat::fragment {"qdrouter+listener_${title}.conf":
    target  => $qpid::router::config_file,
    content => template('qpid/router/listener.conf.erb'),
    order   => '05',
  }

}
