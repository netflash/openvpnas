default['openvpnas']['url'] = 'http://swupdate.openvpn.org/as/openvpn-as-2.0.6-CentOS6.x86_64.rpm'

default['openvpnas']['dir'] = '/usr/local/openvpn_as/'

default['openvpnas']['company_name'] = ''
default['openvpnas']['logo'] = ''

default['openvpnas']['backup']['enabled'] = false
default['openvpnas']['backup']['bucket'] = ''

default['openvpnas']['ssl'] = false

default['citadel']['bucket'] = node['openvpnas']['backup']['bucket']
