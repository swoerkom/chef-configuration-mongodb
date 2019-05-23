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
