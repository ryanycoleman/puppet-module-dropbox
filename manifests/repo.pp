class dropbox::repo {

  case $osfamily {
    'Debian': {

      $os_lowercase = downcase($::operatingsystem)

      apt::source { 'dropbox':
        location => "http://linux.dropbox.com/${dropbox::repo::os_lowercase}",
        release  => $::lsbdistcodename,
        repos    => 'main',
        include  => {
          'src' => false,
        },
      }

      apt::key { 'dropbox':
        id     => '1C61A2656FB57B7E4DE0F4C1FC918B335044912E',
        server => 'pgp.mit.edu',
      }

    }

  }

}