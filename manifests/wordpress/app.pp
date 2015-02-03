class profile::wordpress::app(
  $db_host = query_nodes('Class[profile::wordpress::db]', fqdn),
  $db_name,
  $db_user,
  $db_password
) {
  class { '::wordpress':
    db_user     => $db_user,
    db_password => $db_password,
    db_host     => $db_host
  }
}
