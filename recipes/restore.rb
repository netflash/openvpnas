include_recipe 'python::default'

python_pip 'awscli'

template '/usr/local/bin/openvpnas-restore' do
  source 'openvpnas-restore.erb'
  mode '0755'
  backup false

  action :create
end

# run the restore
execute '/usr/local/bin/openvpnas-restore' do
  action :run

  not_if { File.exist?("#{node['openvpnas']['dir']}/RESTORED") }
end
