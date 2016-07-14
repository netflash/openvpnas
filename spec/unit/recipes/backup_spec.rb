require_relative '../../spec_helper'

describe 'openvpnas::backup' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
end
