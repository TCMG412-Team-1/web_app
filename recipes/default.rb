include_recipe 'apt::default'
include_recipe 'web_app::mbcdb'
include_recipe 'web_app::database'
include_recipe 'web_app::firewall'
include_recipe 'web_app::web_user'
include_recipe 'web_app::web'
