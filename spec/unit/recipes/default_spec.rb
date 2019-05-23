#
# Cookbook:: mongodb
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongodb::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'updates all sources' do
      expect(chef_run).to update_apt_update 'update'
    end
    it 'should add mungo to the source list' do
      expect(chef_run).to add_apt_repository 'mongodb-org'
    end
    it 'should install mongodb' do
      expect(chef_run).to upgrade_package 'mongodb-org'
    end
    

    describe file('/Users/tech-a04/Documents/week-9/day-3/chef/cookbooks/mongodb--proxy/templates/nginx_proxy.conf.erb') do
    it { should exist }
  end


  end

end
