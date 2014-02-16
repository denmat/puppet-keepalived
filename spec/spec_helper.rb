# clear any extra command line arguments
ARGV.clear

require 'rubygems'
require 'bundler/setup'
require 'rspec-puppet'

Bundler.require :default, :test

require 'puppetlabs_spec_helper/module_spec_helper'
require 'hiera-puppet-helper/rspec'
require 'hiera'
require 'puppet/indirector/code'

FIXTURE_PATH = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

# config hiera to work with let(:hiera_data)
def hiera_stub
  config = Hiera::Config.load(hiera_config)
  config[:logger] = 'puppet'
  Hiera.new(:config => config)
end

shared_context "module_data" do
  let(:hiera_config) { {
    :backends => ['rspec', 'module_data', 'yaml'],
    :hierarchy => [ 'nodes/%{fqdn}', 'common' ]
    }  }
#  Puppet::Util::Log.level = :debug
#  Puppet::Util::Log.newdestination(:console)
end

RSpec.configure do |conf|

  conf.formatter = :documentation
  conf.color = :true

  conf.mock_framework = :rspec

  conf.before(:each) do
    Puppet::Indirector::Code.stub(:hiera => hiera_stub)
  end

  conf.module_path = File.join(FIXTURE_PATH, 'modules')
  conf.manifest_dir = File.join(FIXTURE_PATH, 'manifests')
end


