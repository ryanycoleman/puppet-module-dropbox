class dropbox(
  $manage_repo = true,
) {

  if $manage_repo {
    require dropbox::repo
  }
  
  package { 'dropbox':
    ensure => installed,
  }

  file { 'Dropbox sysctl conf':
    path => '/etc/sysctl.d/10-dropbox.conf',
    ensure => file,
    owner => 'root', group => 'root', mode => '0644',
    content => 'fs.inotify.max_user_watches = 100000',
  }

  exec { 'Dropbox sysctl settings':
    path => ['/bin','/sbin','/usr/bin','/usr/sbin'],
    command => 'sysctl -p /etc/sysctl.d/10-dropbox.conf',
    refreshonly => true,
    subscribe => File['Dropbox sysctl conf'],
  }
}
