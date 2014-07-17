# == Class: dropbox::service
#
# This class handles deployments of DropBox service
#
# == Actions:
#
# * Adds an init script and registers it
# * Declares the service Puppet resource
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
class dropbox::service {

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
        unless  => 'ls -1 /etc/rc*.d | grep -q dropbox',
        require => File['/etc/init.d/dropbox'],
      }

      service { 'dropbox':
        ensure     => $dropbpx::service_ensure,
        enable     => $dropbox::service_enable,
        hasrestart => true,
        require    => File['/etc/init.d/dropbox']
      }

    }

    default: {
      fail "Unsupported osfamily: ${::osfamily}"
    }

  }

}

