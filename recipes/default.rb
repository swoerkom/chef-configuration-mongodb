#
# Cookbook:: mongodb
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apt_update 'update' do
  action :update
end

#Grabs Mongodb
apt_repository 'mongodb-org' do
  uri "http://repo.mongodb.org/apt/ubuntu"
  distribution "xenial/mongodb-org/3.2"
  components ["multiverse"]
  keyserver "hkp://keyserver.ubuntu.com:80"
  key "EA312927"
end

#Installs Mongodb
package 'mongodb-org' do
  action :upgrade
end


service 'mongodb-org' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end


template '/etc/mongod.conf' do
  source 'mongodb_proxy.conf.erb'
  variables proxy_port: 27017
end

template '/lib/systemd/system/mongod.service' do
  source 'mongod.service.erb'
end
