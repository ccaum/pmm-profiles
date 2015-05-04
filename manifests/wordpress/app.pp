class profile::wordpress::app(
  $db_host = query_nodes('Class[profile::wordpress::db]', fqdn),
  $db_name = $::profile::wordpress::db_name,
  $db_user = $::profile::wordpress::db_user,
  $db_password = $::profile::wordpress::db_password,
) {
  class { '::wordpress':
    db_user     => $db_user,
    db_password => $db_password,
    db_host     => $db_host
  }
}
