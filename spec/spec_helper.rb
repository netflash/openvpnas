require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/sugar'

RSpec.configure do |config|
  config.platform = 'centos'
  config.version = '6.5'
end

at_exit { ChefSpec::Coverage.report! }
