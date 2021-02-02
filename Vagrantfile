
Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'

  config.vm.synced_folder '.', '/site', type: 'rsync'
  config.vm.provision :shell do |shell|
    shell.inline = "
    wget https://apt.puppet.com/puppet-tools-release-xenial.deb
    sudo dpkg -i puppet-tools-release-xenial.deb
    sudo apt-get update
    sudo apt-get -y install puppet-bolt puppet
    sudo puppet resource package puppet ensure=latest
    sudo puppet resource service puppet ensure=running
    sudo -i
    cd /site/puppet
    "
  end
  config.vm.provision 'puppet' do |puppet|
    puppet.options = '--verbose --debug'
    # FYI path and file are relative to the vagrant file and not where files are mounted on this machine
    puppet.manifests_path = './puppet/manifests'
    puppet.module_path = './puppet/modules'
    puppet.manifest_file = 'apache.pp'
  end
end

