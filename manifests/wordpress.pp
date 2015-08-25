class profile::wordpress {

  class { 'apache':
    default_vhost => true,
  }

  class { 'apache::mod::php': }

  class { 'wordpress':
    require => [
      Class['mysql::server'],
      Class['apache'],
      Class['apache::mod::php'],
    ],
  }

  class { 'mysql::server': }

  apache::vhost { 'wordpress':
    docroot => '/opt/wordpress',
  }
}
