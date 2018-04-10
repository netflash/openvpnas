name 'openvpnas'
version '0.1.6'
description 'OpenVPN Access Server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
maintainer 'Robert Coleman'
maintainer_email 'github@robert.net.nz'

supports 'redhat'
supports 'ubuntu'

%w(apt yum chef-sugar line poise-python citadel).each do |cookbook|
  depends cookbook
end
