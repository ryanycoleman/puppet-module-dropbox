# == Class: dropbox::install
#
# This class handles installation of the DropBox package.
#
# == Actions:
#
# * Installs the dropbox package.
#
# === Authors:
#
# Ryan Coleman
# Craig Watson
#
class dropbox::install {

  if $dropbox::manage_repo == true {
    require dropbox::repo
  }

  package { ['dropbox','python-gpgme']:
    ensure => installed,
  }

}
