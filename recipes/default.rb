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

node.override['elasticsearch']['install']['version'] =
  node['chef_rails_elasticsearch']['version']

node.override['elasticsearch']['configure']['configuration'] = {
  'network.host' => node['chef_rails_elasticsearch']['listen']
}

include_recipe 'elasticsearch'

if node['chef_rails_elasticsearch']['plugins']['analysis-morphology']
  unless File.exist? '/usr/share/elasticsearch/plugins/analysis-morphology'
    elasticsearch_plugin 'analysis-morphology' do
      url(
        'http://dl.bintray.com/content/imotov/elasticsearch-plugins/org/elasticsearch/elasticsearch-analysis-morphology/' +
          node['elasticsearch']['install']['version'] +
          '/elasticsearch-analysis-morphology-' +
          node['elasticsearch']['install']['version'] + '.zip'
      )
      action :install
    end
  end
end

# elasticsearch_plugin('x-pack') { action :install }
