# == Class: dropbox::params
#
# This class handles parameters for the vmwaretools module, including the logic
# that decided if we should install a new version of VMware Tools.
#
#
# == Actions:
#
# None
#
# === Authors:
#
# Ryan Coleman
# Craig Watson
#
class dropbox::params {

  if $dropbox::autostart_users != 'none' {
    $autostart_users_real = inline_template('<% if scope.lookupvar(\'dropbox::autostart_users\').is_a? Array -%><% scope.lookupvar(\'dropbox::autostart_users\').each do |autostart_user| -%><%= autostart_user %> <% end -%><% else -%><%= scope.lookupvar(\'dropbox::autostart_users\') %><% end -%>')
  } else {
    $autostart_users_real = ''
  }

  $dropbox_daemon_path = '/usr/bin/dropbox'

}
