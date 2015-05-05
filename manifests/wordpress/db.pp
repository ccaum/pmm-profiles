class profile::wordpress::db (
  $app_hosts = query_nodes('Class[profile::wordpress::app]', fqdn),
  $db_name = $::profile::wordpress::db_name,
) {
  include ::mysql::server

  mysql_database { $db_name: ensure => present, }

  Mysql_user  <<||>>
  Mysql_grant <<||>>
}
