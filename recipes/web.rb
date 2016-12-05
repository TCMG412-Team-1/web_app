# Install Apache and start the service.
httpd_service 'customers' do
  mpm 'prefork'
  action [:create, :start]
end

# Add the site configuration.
httpd_config 'customers' do
  instance 'customers'
  source 'customers.conf.erb'
  notifies :restart, 'httpd_service[customers]'
end

# Create the document root directory.
directory node['web_app']['document_root'] do
  recursive true
end

# Write the home page.
file "#{node['web_app']['document_root']}/index.html" do
  content '<html>This is a placeholder</html>'
  mode '0644'
  owner node['web_app']['user']
  group node['web_app']['group']
end

execute 'install_software_properties' do
  command "apt-get -y install python-software-properties"
end

execute 'add_php_repo' do
  command 'add-apt-repository ppa:ondrej/php'
end

execute 'apt-get_update' do
  command 'apt-get update'
end

execute 'install_php' do
  command 'apt-get -y install php'
end

# # Install the mod_php5 Apache module.
# httpd_module 'php5' do
#   instance 'customers'
# end

# # Install php5-mysql.
# package 'php5-mysql' do
#   action :install
#   notifies :restart, 'httpd_service[customers]'
# end