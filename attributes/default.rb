case node['platform_family']
when 'debian'
  default['openvpnas']['url'] = 'http://swupdate.openvpn.org/as/openvpn-as-2.1.2-Ubuntu12.amd_64.deb'
  case node['platform']
  when 'ubuntu'
    case node['platform_version'].split('.')[0]
    when '12'
      default['openvpnas']['url'] = 'http://swupdate.openvpn.org/as/openvpn-as-2.1.2-Ubuntu12.amd_64.deb'
    when '14'
      default['openvpnas']['url'] = 'http://swupdate.openvpn.org/as/openvpn-as-2.1.2-Ubuntu14.amd_64.deb'
    when '16'
      default['openvpnas']['url'] = 'http://swupdate.openvpn.org/as/openvpn-as-2.1.2-Ubuntu16.amd_64.deb'
    end
  end
when 'rhel'
  case node['platform_version'].split('.')[0]
  when '6'
    default['openvpnas']['url'] = 'http://swupdate.openvpn.org/as/openvpn-as-2.1.2-CentOS6.x86_64.rpm'
  when '7'
    default['openvpnas']['url'] = 'http://swupdate.openvpn.org/as/openvpn-as-2.1.2-CentOS7.x86_64.rpm'
  end
end

default['openvpnas']['dir'] = '/usr/local/openvpn_as'

default['openvpnas']['company_name'] = ''
default['openvpnas']['logo'] = ''

default['openvpnas']['backup']['enabled'] = false
default['openvpnas']['backup']['bucket'] = ''

default['openvpnas']['ssl'] = false

default['citadel']['bucket'] = node['openvpnas']['backup']['bucket']
