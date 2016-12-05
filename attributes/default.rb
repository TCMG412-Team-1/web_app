def random_password
  require 'securerandom'
  SecureRandom.base64
end

default['firewall']['allow_ssh'] = true
default['web_app']['open_ports'] = 80

default['web_app']['user'] = 'web_admin'
default['web_app']['group'] = 'web_admin'
default['web_app']['document_root'] = '/var/www/customers/public_html'

normal_unless['web_app']['database']['root_password'] = 'password'
normal_unless['web_app']['database']['admin_password'] = 'password'
default['web_app']['database']['dbname'] = 'mbcdb'
default['web_app']['database']['host'] = '127.0.0.1'
default['web_app']['database']['root_username'] = 'root'
default['web_app']['database']['admin_username'] = 'mbcdb_admin'

default['web_app']['repo_name'] = 'explore_california'
default['web_app']['repo_url'] = 'https://github.com/kevinskoglund/explore_california.git'
default['web_app']['branch'] = 'master'
default['web_app']['repo_path'] = "#{node['web_app']['document_root']}/#{node['web_app']['repo_name']}"



