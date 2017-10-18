#
# Cookbook Name:: chef_rails_elasticsearch
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'java'
include_recipe 'elasticsearch'

elasticsearch_configure 'elasticsearch' do
  if node['chef_rails_elasticsearch']['allocated_memory']
    allocated_memory node['chef_rails_elasticsearch']['allocated_memory']
  end

  configuration 'network.host' => '127.0.0.1'
end

# elasticsearch_plugin('x-pack') { action :install }
