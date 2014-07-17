# == Class: dropbox
#
# This class handles installation of DropBox. Currently, it just supports
# Debian.
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
#   DEFAULT: true (boolean)
#
# [*manage_service*]
#   Boolean that controls whether to manage the DropBox service.
#   DEFAULT: true (boolean)
#
# [*service_enabled*]
#   Parameter passed to the DropBox service resource. Only used if
#   manage_service parameter is set to true.
#   DEFAULT: true (boolean)
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
  $manage_repo     = true,
  $manage_service  = true,
) {

  include dropbox::params
  include dropbox::install
  include dropbox::config

}
