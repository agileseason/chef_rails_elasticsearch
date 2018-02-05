#
# Cookbook Name:: chef_rails_elasticsearch
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'java'

node.override['elasticsearch']['configure']['allocated_memory'] =
  node['chef_rails_elasticsearch']['allocated_memory']
node.override['elasticsearch']['configure']['configuration'] = {
  'network.host' => '127.0.0.1'
}

include_recipe 'elasticsearch'

elasticsearch_plugin 'elasticsearch-analysis-morphology' do
  url(
    'http://dl.bintray.com/content/imotov/elasticsearch-plugins/org/elasticsearch/elasticsearch-analysis-morphology/' +
      node['elasticsearch']['install']['version'] +
      '/elasticsearch-analysis-morphology-' +
      node['elasticsearch']['install']['version'] + '.zip'
  )
  action :install
end

# elasticsearch_plugin('x-pack') { action :install }
