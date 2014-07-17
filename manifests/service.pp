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

      require dropbox::service::config

      service { 'dropbox':
        ensure     => $dropbox::service_ensure,
        enable     => $dropbox::service_enable,
        hasrestart => true,
      }

    }

    default: {
      fail "Unsupported osfamily: ${::osfamily}"
    }

  }

}

