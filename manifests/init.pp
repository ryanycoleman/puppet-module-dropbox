# == Class: dropbox
#
# This class handles installation of DropBox. Currently, it just supports
# the Debian osfamily.
#
# Be warned that it will simply install a shell of the client and will NOT
# configure it.
#
# === Parameters:
#
# [*autostart_users*]
#   List of users (either a space-separated String on an Array) to autostart
#   DEFAULT: 'none' (String)
#
# [*manage_repo*]
#   Boolean that controls whether to add the DropBox apt repository.
#   DEFAULT: false (boolean)
#
# [*manage_service*]
#   Boolean that controls whether to manage the DropBox service.
#   DEFAULT: false (boolean)
#
# [*service_enabled*]
#   Passed to the DropBox service resource to set the 'enabled' attribute. Only
#   used if the manage_service parameter is set to true.
#   DEFAULT: true (boolean)
#
# [*service_ensure *]
#   Passed to the DropBox service resource to set the 'ensure' attribute. Only
#   used if the manage_service parameter is set to true.
#   DEFAULT: running (Puppet special type)
#
# == Actions:
#
# * Installs the dropbox package.
# * Optionally, adds and configures the DropBox apt repository.
#
# === Requires:
#
# * Debian $::osfamily
#
# === Sample Usage:
#
# To accept defaults:
#
#   include dropbox
#
# To disable repository management and autostart the users 'bob' and 'jane':
#
#   class { 'dropbox':
#     manage_repo     => false,
#     autostart_users => ['bob','jane'],
#   }
#
# === Authors:
#
# Ryan Coleman
# Craig Watson
#
class dropbox(
  $autostart_users = 'none',
  $manage_repo     = false,
  $manage_service  = false,
  $service_enabled = true,
  $service_ensure  = running,
) {

  include dropbox::params
  include dropbox::install

  if $manage_service == true {
    include dropbox::service
  }

}
