wget -O /vagrant/puppet.tar.gz https://s3.amazonaws.com/pe-builds/released/3.1.2/puppet-enterprise-3.1.2-ubuntu-12.04-i386.tar.gz -q -nc

mkdir -p /vagrant/puppet

tar -zxf /vagrant/puppet.tar.gz -C /vagrant/puppet

/vagrant/puppet/puppet-enterprise-3.1.2-ubuntu-12.04-i386/puppet-enterprise-installer -a $1
