# Clones the explore california website
git "#{node['web_app']['document_root']}" do
  repository node['web_app']['repo_url']
  revision node['web_app']['branch']
  action :sync
end

# Set a redirect in the default apache2 file.
# This is easier than setting the document root, so why not
file '/var/www/html/index.html' do
  content "
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset=\"utf-8\">
      <title>Redirect</title>
      <meta http-equiv=\"refresh\" content=\"0; url=#{node['web_app']['node_url']}/explore_california/\" />
    </head>
    <body>
      <h3>If you are not redirected, please follow <a href=\"/explore_california/\">this link</a></h3>
    </body>
  </html>
  "
end