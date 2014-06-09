name 'openvpnas'
version '0.1.3'
description 'OpenVPN Access Server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
maintainer 'Robert Coleman'
maintainer_email 'github@robert.net.nz'

supports 'redhat'

%w(yum chef-sugar line python citadel).each do |cookbook|
  depends cookbook
end
