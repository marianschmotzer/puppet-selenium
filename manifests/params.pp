# == Class: selenium::params
#
# This class should be considered private.
#
#
class selenium::params {
  $display          = ':0'
  $user             = 'selenium'
  $manage_user      = true
  $group            = $user
  $manage_group     = true
  $install_root     = '/opt/selenium'
  $server_options   = ''
  $hub_options      = '-role hub'
  $node_options     = "${server_options} -role node"
  $java             = '/usr/bin/java'
  $version          = '2.45.0'
  $default_hub      = 'http://localhost:4444/grid/register'
  $download_timeout = '90'
  $default_classpath = []
  case $::osfamily {
    'redhat': {
      $service_template = 'redhat.selenium.erb'
    }
    'debian': {
      $service_template = 'debian.selenium.erb'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }

  if $::lsbmajdistrelease > 7 {
      $systemd = $::osfamily ? {
        'Debian' => true,
        'RedHat' => true,
        default  => false,
      }
  }else{
    $systemd = false
  }

}
