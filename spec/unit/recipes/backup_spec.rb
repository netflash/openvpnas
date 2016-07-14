require_relative '../../spec_helper'

describe 'openvpnas::backup' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

end
