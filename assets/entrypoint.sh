#!/usr/bin/env bash

set -e
source /assets/colorecho
yum -y update
yum -y install cronie-anacron file
yum -y install compat-libstdc++-33
if [ ! -d "/opt/oracle/app/product/11.2.0/dbhome_1" ]; then
	echo_yellow "Database is not installed. Installing..."
	/assets/install.sh
fi
	mkdir -p -m 755 /opt/oracle/app
	mkdir -p -m 755 /opt/oracle/oraInventory
	mkdir -p -m 755 /opt/oracle/dpdump
	chown -R oracle:oinstall /opt/oracle
	cat /assets/profile >> ~oracle/.bash_profile
	cat /assets/profile >> ~oracle/.bashrc
	
su oracle -c "/assets/entrypoint_oracle.sh"

