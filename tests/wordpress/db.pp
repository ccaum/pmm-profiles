class { '::profile::wordpress::db':
  app_hosts   => 'localhost',
  db_name     => 'wordpress',
  db_user     => 'wordpress',
  db_password => 'wordpress',
}
