source "https://rubygems.org"

group :development, :test do
  gem 'rspec-puppet', '0.1.6'
  gem 'rspec-core', '<= 2.14.7'
  gem 'rspec-system-puppet', '2.2.1'
  gem 'puppet-lint', '0.3.2'
  gem 'puppetlabs_spec_helper', '0.4.1'
  gem 'hiera-puppet-helper'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

# vim:ft=ruby
