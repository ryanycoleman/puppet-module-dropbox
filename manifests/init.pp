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
# [*manage_repo*]
#   Boolean that controls whether to add the DropBox apt repository.
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
# To disable repository management:
#
#   class { 'dropbox':
#     version     => '8.6.5-621624',
#   }
#
# === Authors:
#
# Ryan Coleman
# Craig Watson
#
class dropbox(
  $manage_repo = true,
) {

  include dropbox::install

}
