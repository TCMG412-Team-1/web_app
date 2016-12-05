git "#{node['web_app']['document_root']}" do
  repository node['web_app']['repo_url']
  revision node['web_app']['branch']
  action :sync
end
#
# execute 'composer_install' do
#   command "#{node['web_app']['repo_path']} sudo composer install"
# end
#
# file "#{node['web_app']}/.env" do
#   :create_if_missing
#   content "APP_ENV=local
#     APP_DEBUG=true
#     APP_KEY=
#     APP_URL=http://localhost
#     PRODUCTION=false
#
#     # here you can provide a github account. When a user submits feedback, it automatically creates
#     # a github issue. The only problem is that you need to have a github account to create an issue.
#     # You can create a dummy account and provide credentials here if you want.
#     #
#     # Code for this is in BugController.php, using make_github_issue.py
#
#     GITHUB_USERNAME=
#     GITHUB_PASSWORD=
#
#
#     DB_CONNECTION=mysql
#     DB_HOST=127.0.0.1
#     DB_PORT=3306
#     DB_DATABASE=#{node['web_app']['database']['dbname']}
#     DB_USERNAME=#{node['web_app']['database']['admin_username']}
#     DB_PASSWORD=#{node['web_app']['database']['admin_password']}
#
#     CACHE_DRIVER=file
#     SESSION_DRIVER=file
#     QUEUE_DRIVER=sync
#
#     REDIS_HOST=127.0.0.1
#     REDIS_PASSWORD=null
#     REDIS_PORT=6379
#
#     MAIL_DRIVER=smtp
#     MAIL_HOST=smtp.gmail.com
#     MAIL_PORT=2525
#     MAIL_USERNAME=help.mbcdb@gmail.com
#     MAIL_PASSWORD=
#     MAIL_ENCRYPTION=tls"
#
# end