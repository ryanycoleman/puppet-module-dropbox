class dropbox(
  $manage_repo = true,
) {

  if $manage_repo {
    require dropbox::repo
  }
  
  package { 'dropbox':
    ensure => installed,
  }

}
