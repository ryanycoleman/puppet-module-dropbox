class dropbox::repo {
  
  case $osfamily {
    'Debian': {
      
      $os_lowercase = downcase($::operatingsystem)
      
      apt::source { 'dropbox':
        location          => "http://linux.dropbox.com/${dropbox::repo::os_lowercase}",
        release           => $::lsbdistcodename,
        repos             => 'main',
        key               => {
          'id'     => '5044912E',
          'server' => 'pgp.mit.edu',
        },
      }
      
    }
    
  }
  
}
