python_runtime '2.7'

python_package 'awscli'

template '/usr/local/bin/openvpnas-backup' do
  source 'openvpnas-backup.erb'
  mode '0755'
  backup false

  action :create
  only_if { node['openvpnas']['backup']['enabled'] }
end

cron 'backup_openvpnas' do
  minute '0'
  hour '4'
  command '/usr/bin/flock -n /var/lock/o-backup /usr/local/bin/openvpnas-backup >>/var/log/openvpnas-backup.log 2>&1'

  action :create
  only_if { node['openvpnas']['backup']['enabled'] }
end
