VERSION=3.4.3-1puppetlabs1 

# Prepare puppetlabs repo
wget http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
dpkg -i puppetlabs-release-wheezy.deb
apt-get update
rm -f puppetlabs-release-wheezy.deb

# Install puppet/facter
apt-get install -y puppet=$VERSION puppet-common=$VERSION
sed -i -re "/\[main\]/ apluginsync = true" /etc/puppet/puppet.conf;