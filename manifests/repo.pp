class dropbox::repo {
  
  case $osfamily {
    'Debian': {
      
      $os_lowercase = downcase($::operatingsystem)
      
      apt::source { 'dropbox':
        location          => "http://linux.dropbox.com/${dropbox::repo::os_lowercase}",
        release           => $::lsbdistcodename,
        repos             => 'main',
        include_src       => false,
      }
      
			apt::key { 'dropbox':
			  key        => '5044912E',
			  key_server => 'pgp.mit.edu',
			}
      
    }
    
  }
  
}