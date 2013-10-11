# Dropbox #

This is a simple module for installing the Dropbox client.

Currently, it just supports the Debian $osfamily but should be trivial to extend by following [these instructions](https://www.dropbox.com/help/246/en) provided by Dropbox. Be warned that it will simply install a shell of the client. Dropbox designed their client to be thin, relying on it to download the full software and configure it. 

Use it by declaring the Dropbox class.

`include dropbox`

It accepts one parameter, 'manage_repo' which defaults to true. This parameter configures the Dropbox apt repository and key via [puppetlabs/apt](http://forge.puppetlabs.com).
