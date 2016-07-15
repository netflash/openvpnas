require 'chefspec'
require 'chef/sugar'
require 'chefspec/berkshelf'

describe 'openvpnas::default' do
  package_checks = {
    'ubuntu' => {
      '12.04' => ['openvpnas'],
      '14.04' => ['openvpnas'],
      '16.04' => ['openvpnas']
    },
    'centos' => {
      '6.7' => ['openvpnas'],
      '7.2.1511' => ['openvpnas']
    }
  }

  package_checks.each do |platform, versions|
    versions.each do |version, packages|
      packages.each do |package_name|
        it "should install #{package_name} on #{platform} #{version}" do
          chef_runner = ChefSpec::SoloRunner.new(platform: platform, version: version)
          chef_runner.converge(described_recipe)
        end
      end
    end
  end

end
