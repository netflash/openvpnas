require_relative '../../spec_helper'

describe 'openvpnas::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
end
