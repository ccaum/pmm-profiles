class profile::pulp {
  require 'epel'

  class { '::pulp': }
  class { '::pulp::server': }
  class { '::pulp::admin_client': }
  class { '::pulp::consumer': }

  # Create a puppet repo
  puppet_repo { 'repo_id':
    # Default pulp admin login/password
    ensure       => 'present',
    login        => 'admin',
    password     => 'admin',
    display_name => 'my Forge repo',
    description  => "Locally copy the modules from the Forge used by the PE demo",
    feed         => 'http://forge.puppetlabs.com',
    queries      => ['puppetlabs/java', 'puppetlabs/git'],
    schedules    => [ '2012-12-16T00:00Z/P1D', '2012-12-17T00:00Z/P1D' ],
    serve_http   => true,
    serve_https  => true,
  }
}
