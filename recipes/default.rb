# need chef-sugar
include_recipe 'chef-sugar::default'

if redhat?
  compile_time do
    yum_repository 'epel' do
      description 'Extra Packages for Enterprise Linux'
      mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
      gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
      action :create
    end

    # update openssl - CVE-2014-0160 https://rhn.redhat.com/errata/RHSA-2014-0376.html
    package 'openssl' do
      action :upgrade
    end

    remote_file "#{Chef::Config[:file_cache_path]}/openvpn-as.rpm" do
      source node['openvpnas']['url']
      action :create
    end

    yum_package 'openvpn-as' do
      source "#{Chef::Config[:file_cache_path]}/openvpn-as.rpm"
      action :upgrade
    end
  end # end compile_time
elsif ubuntu?
  compile_time do

    package 'openssl' do
      action :upgrade
    end

    remote_file "#{Chef::Config[:file_cache_path]}/openvpn-as.deb" do
      source node['openvpnas']['url']
      action :create
    end

    dpkg_package 'openvpn-as' do
      source "#{Chef::Config[:file_cache_path]}/openvpn-as.deb"
      action :install
    end
  end
end

# logo
file "#{node['openvpnas']['dir']}/logo.png" do
  content Base64.decode64(node['openvpnas']['logo'])
  mode '0755'
  action :create

  not_if { node['openvpnas']['logo'].empty? }
end

replace_or_add 'sa.company_name' do
  path '/usr/local/openvpn_as/as.conf'
  pattern 'sa.company_name=*'
  line node['openvpnas']['company_name']

  not_if { node['openvpnas']['company_name'].empty? }

  notifies :restart, 'service[openvpnas]', :delayed
end

replace_or_add 'sa.logo_image_file' do
  path '/usr/local/openvpn_as/as.conf'
  pattern 'sa.logo_image_file=*'
  line "sa.logo_image_file=#{node['openvpnas']['dir']}/logo.png"

  not_if { node['openvpnas']['logo'].empty? }

  notifies :restart, 'service[openvpnas]', :delayed
end

# ssl
file "#{node['openvpnas']['dir']}/web-ssl/server.key" do
  owner 'root'
  group 'root'
  mode '600'
  content citadel['ssl/server.key'] if node['openvpnas']['ssl']

  only_if { node['openvpnas']['ssl'] }
  notifies :restart, 'service[openvpnas]', :delayed
end

file "#{node['openvpnas']['dir']}/web-ssl/ca.crt" do
  owner 'root'
  group 'root'
  mode '644'
  content citadel['ssl/ca.crt'] if node['openvpnas']['ssl']

  only_if { node['openvpnas']['ssl'] }
  notifies :restart, 'service[openvpnas]', :delayed
end

file "#{node['openvpnas']['dir']}/web-ssl/server.crt" do
  owner 'root'
  group 'root'
  mode '644'
  content citadel['ssl/server.crt'] if node['openvpnas']['ssl']

  only_if { node['openvpnas']['ssl'] }
  notifies :restart, 'service[openvpnas]', :delayed
end

service 'openvpnas' do
  action :nothing
end
