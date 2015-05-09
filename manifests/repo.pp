# == Class: dropbox::repo
#
# This class handles installation of the DropBox Debian apt repository.
#
# NOTE: This will fail on any non-Debian $::osfamily!
#
# == Actions:
#
# * Adds and configures the DropBox apt repository.
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
class dropbox::repo {

  case $::osfamily {

    'Debian': {
      $os_lowercase = downcase($::operatingsystem)
      apt::source { 'dropbox':
        location => "http://linux.dropbox.com/${dropbox::repo::os_lowercase}",
        release  => $::lsbdistcodename,
        repos    => 'main',
        include  => { 'src' => true, },
      }

      apt::key { 'dropbox':
        id         => '1C61A2656FB57B7E4DE0F4C1FC918B335044912E',
        key_server => 'pgp.mit.edu',
      }
    }

    default: {
      fail "Unsupported osfamily: ${::osfamily}"
    }

  }

}
