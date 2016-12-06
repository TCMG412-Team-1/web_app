# Clones the explore california website
git "#{node['web_app']['document_root']}" do
  repository node['web_app']['repo_url']
  revision node['web_app']['branch']
  action :sync
end
