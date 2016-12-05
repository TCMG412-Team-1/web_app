#
# Cookbook Name:: web_app
# Recipe:: web_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
group node['web_app']['group']

user node['web_app']['user'] do
  group node['web_app']['group']
  system true
  shell '/bin/bash'
end