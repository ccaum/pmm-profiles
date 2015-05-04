class profile::wordpress::db(
  $app_hosts = query_nodes('Class[profile::wordpress::app]', fqdn),
  $db_name = $::profile::wordpress::db_name,
  $db_user = $::profile::wordpress::db_user,
  $db_password = $::profile::wordpress::db_password,
) {
  $db_overrides = {
    'mysqld' => { 'bind-address' => '0.0.0.0' }
  }

  class { 'mysql::server': 
    remove_default_accounts => true,
    override_options        => $db_overrides,
  }

  mysql_database { $db_name: }

  $app_host_users  = generate_host_db_users($db_user, $app_hosts, $db_password)
  $app_host_grants = generate_host_db_grants($db_user, $app_hosts, ['SELECT','GRANT'], '*.*')

  create_resources('mysql_user', $app_host_users)
  create_resources('mysql_grant', $app_host_grants)
}
