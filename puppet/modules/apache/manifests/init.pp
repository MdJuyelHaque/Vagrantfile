
class apache (
  $apachename   = $::apache::params::apachename,
) 
inherits ::apache::params
{

  package { 'apache':
    name    => $apachename,
    ensure  => present,
  }

file { 'configuration-file':
  path    => $conffile,
  ensure  => file,
  source  => $confsource,
  notify  => Service['apache-service'],
}


file {
    'my-script':
      ensure => 'present',
      source => "puppet:///modules/apache/basicauth.sh", 
      path => '/tmp/basicauth.sh',
      owner => 'root',
      group => 'root',
      mode  => '0744',
      notify => Exec['run_my_script'],
  }
  exec {
    'run_my_script':
     command => '/tmp/basicauth.sh',
     refreshonly => true,
  }


service { 'apache-service':
  name          => $apachename,
  hasrestart    => true,
}

file {
    'my-script-user':
      ensure => 'present',
      source => "puppet:///modules/apache/user.sh",
      path => '/tmp/user.sh',
      owner => 'root',
      group => 'root',
      mode  => '0744',
      notify => Exec['run_my_script-user'],
  }
  exec {
    'run_my_script-user':
     command => '/tmp/user.sh',
     refreshonly => true,
  }



}

