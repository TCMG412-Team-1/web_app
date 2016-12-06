name 'web_app'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures web_app'
long_description 'Installs/Configures web_app'
version '0.2.27'

depends 'apt', '~> 4.0'
depends 'firewall', '~> 2.5'
depends 'httpd', '~> 0.4'
depends 'mysql', '~> 8.2.0'
depends 'mysql2_chef_gem', '~> 1.1'
depends 'database', '~> 6.0'
depends 'php', '~> 1.2.4'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/web_app/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/web_app' if respond_to?(:source_url)
