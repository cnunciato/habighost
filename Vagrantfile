$hab_setup = <<SCRIPT

# Add the hab user and group
groupadd hab || 'Group hab already exists.'
useradd -g hab hab  || 'User hab already exists.'

# Download and install the latest hab package
curl https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh | bash

# Start the most recently built ghost package
hab start $(ls -Art /vagrant/results/*.hart | tail -n 1)
SCRIPT

Vagrant.configure 2 do |config|

  config.vm.define 'web' do |web|
    web.vm.box = 'bento/ubuntu-16.04'

    web.vm.network 'private_network', ip: '192.168.10.200'

    web.vm.provision :shell, inline: $hab_setup

    web.vm.provider 'virtualbox' do |provider|
      provider.memory = 2048
      provider.cpus = 2
    end
  end
end
