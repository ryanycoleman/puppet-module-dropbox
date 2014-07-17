# == Class: dropbox::config
#
# This class handles deployment of DropBox configuration files
#
# == Actions:
#
# === Requires:
#
# === Authors:
#
# Ryan Coleman
# Craig Watson
#
class dropbox::config {

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
        creates => '',
        unless  => '',
        require => File['/etc/init.d/dropbox'],
      }
    }

    default: {
      fail "Unsupported osfamily: ${::osfamily}"
    }

  }

}
