# Configure the MySQL client.
mysql_client 'default' do
  action :create
end

# DO NOT DELETE
execute 'create_symlink_for_mysql' do
  command "ln -s /var/run/mysql-default /var/run/mysqld"
end

# Configure the MySQL service.
mysql_service 'default' do
  initial_root_password node['web_app']['database']['root_password']
  action [:create, :start]
end

# Install the mysql2 Ruby gem.
mysql2_chef_gem 'default' do
  action :install
end

# Create the database instance.
mysql_database node['web_app']['database']['dbname'] do
  connection(
    :host => node['web_app']['database']['host'],
    :username => node['web_app']['database']['root_username'],
    :password => node['web_app']['database']['root_password']
  )
  action :create
end

# Add a database user.
mysql_database_user node['web_app']['database']['admin_username'] do
  connection(
    :host => node['web_app']['database']['host'],
    :username => node['web_app']['database']['root_username'],
    :password => node['web_app']['database']['root_password']
  )
  password node['web_app']['database']['admin_password']
  database_name node['web_app']['database']['dbname']
  host node['web_app']['database']['host']
  action [:create, :grant]
end