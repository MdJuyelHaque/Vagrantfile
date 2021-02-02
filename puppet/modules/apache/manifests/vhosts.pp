class apache::vhosts {

  if $::osfamily == 'RedHat' {
    file { '/etc/httpd/conf.d/vhost.conf':
      ensure    => file,
      content   => template('apache/vhosts-rh.conf.erb'),
    }
    file { [ '/var/www/$servername',
             '/var/www/$servername/public_html',
             '/var/www/$servername/log', ]:
      ensure    => directory,
    }
  } elsif $::osfamily == 'Debian' {
    file { "/etc/apache2/sites-available/$servername.conf":
      ensure  => file,
      content  => template('apache/vhosts-deb.conf.erb'),
    }
    file { [ '/var/www/qa-zenkey.maarkdev.com',
             '/var/www/qa-zenkey.maarkdev.com/public_html',
             '/var/www/qa-zenkey.maarkdev.com/logs', ]:
      ensure    => directory,
    }
  } else {
    fail ( 'This is not a supported distro.')
  }

}
