	rmuser -r -f oracle 
	groupdel oinstall
	groupdel dba
	groupadd -g 200 oinstall
	groupadd -g 201 dba
	useradd -u 440 -g oinstall -G dba -d /opt/oracle oracle
	echo "oracle:install" | chpasswd
	chown -R oracle:oinstall /opt/oracle

docker run --privileged --name oracle11g -p 1521:1521 -v <install_folder>:/install jaspeen/oracle-11g
```
Then you can commit this container to have installed and configured oracle database:
```sh
docker commit oracle11g oracle11g-installed
```

Database located in **/opt/oracle** folder
sid orcl 1521
OS users:
* root/install
* oracle/install

DB users:
* SYS/oracle

Optionally you can map dpdump folder to easy upload dumps:
```sh
docker run --privileged --name oracle11g -p 1521:1521 -v <install_folder>:/install -v <local_dpdump>:/opt/oracle/dpdump jaspeen/oracle-11g
```
To execute impdp/expdp just use docker exec command:
```sh
docker exec -it oracle11g impdp ..
```
