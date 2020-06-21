#!/bin/bash
echo "info: Installing Metasploit framework"
echo "debug: Runnning from scripts/centos/metasploit.sh"

curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
bash ./msfinstall

echo "info: Restarting VM"
shutdown -r now