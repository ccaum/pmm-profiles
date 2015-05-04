class profile::wordpress::db(
  $app_hosts = query_nodes('Class[profile::wordpress::app]', fqdn),
  $db_name,
  $db_user,
  $db_password,
) {
  class { 'mysql::server': }

  if ! empty($app_hosts) {
    mysql::db { $db_name:
      user     => $db_user,
      password => $db_password,
      dbname   => $db_name,
      host     => $app_hosts,
      grant    => ['SELECT','UPDATE'],
    }
  }
}
