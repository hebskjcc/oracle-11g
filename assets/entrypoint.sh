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

su oracle -c "/assets/entrypoint_oracle.sh"

