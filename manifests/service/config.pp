# == Class: dropbox::service::config
#
# This class handles deployments of DropBox service
#
# == Actions:
#
# * Adds an init script and registers it
#
# === Requires:
#
# * Debian $::osfamily
#
# === Authors:
#
# Ryan Coleman
# Craig Watson
#
class dropbox::service::config {

  case $::osfamily {

    'Debian': {
      file { '/etc/init.d/dropbox':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('dropbox/init.erb'),
        require => Package['dropbox'],
      }

      exec {'init dropbox service':
        command => '/usr/sbin/update-rc.d dropbox defaults',
        unless  => '/bin/ls -1 /etc/rc*.d | grep -q dropbox',
        require => File['/etc/init.d/dropbox'],
      }

    }

    default: {
      fail "Unsupported osfamily: ${::osfamily}"
    }

  }

}



