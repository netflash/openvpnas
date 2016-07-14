require 'spec_helper'

describe 'openvpnas::default' do
  
  # expect package should be installed
  describe package("openvpn-as") do
    it { should be_installed }
  end

  # check for existence of SA tool
  describe command("/usr/local/openvpn_as/scripts/sa --version") do
    its(:stdout) { should match /^SA tool.*$/ }
  end

  # default port 443 should be listening
  describe port(443) do
    it { should be_listening.with('tcp') }
  end

  # as.conf files should has company_name
  describe file("/usr/local/openvpn_as/as.conf") do
    it { should be_file }
    its(:content) { should match /.*company_name.*/ }
  end

  # service should be enabled and running
  describe service("openvpnas") do
    it { should be_enabled }
    it { should be_running }
  end

end

