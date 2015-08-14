# promenne v prostredi  
. skript.sh
env 

# neco s nastartovanim engine
cd /u01/app/sybase/SYB15.7
. SYBASE.sh 
env | grep SYBASE
cd $SYBASE/$SYBASE_ASE/install 
startserver -f RUN_LNX_ASE157

# jsem ready? 
showserver
which showserver

# pripojeni 
cd $SYBASE
cat interfaces
rlwrap isql -Usa -SLNX_ASE157 -w1000

# nejake prikazy
select $$servername
select * from master.dbo.sysdatabases
sp_who 
select * from syslogins;
select * from master.dbo.sysdatabases;
select db_name();
select user_name();

-- create new devices on specific patk
disk init name = 'my_device1', physname='/u01/app/sybase/SYB15.7/data/disk1/my_device1.dbf', size = '10M';
--sp_dropdevice 'my_device1';
disk init name = 'my_device2', physname='/u01/app/sybase/SYB15.7/data/disk2/my_device2.dbf', size = '10M';
--sp_dropdevice 'my_device2';
disk init name = 'my_device3', physname='/u01/app/sybase/SYB15.7/data/disk3/my_device3.dbf', size = '10M';
--sp_dropdevice 'my_device3';

sp_configure 'number of devices';
sp_configure 'number of devices', 15;

disk init name = 'my_device4', physname='/u01/app/sybase/SYB15.7/data/disk4/my_device4.dbf', size = '10M';
disk init name = 'my_device_log', physname='/u01/app/sybase/SYB15.7/data/disk_log/my_device_log.dbf', size = '10M';
-- sp_dropdevice 'my_device_log';


select * from sysdevices

-- set defualt devices
sp_diskdefault my_device1, defaulton
sp_diskdefault my_device2, defaulton
sp_diskdefault master, defaultoff

-- change device size
-- but it increase size NOT change
disk resize name = 'my_device1', size = '10M'

-- show device description
sp_helpdevice

-- create database 
create database myDB on my_device1 = '8M', my_device2='8M' log on my_device_log 

-- show infor about databases
select * from sysdatabases 
sp_helpdb

-- show logins 
select * from syslogins

-- if i want to execute any procedure in specific database
myDB..sp_changedbowner martinLogin

-- create table 
create table myDB..t1 (s1 varchar(10))

use myDB;

sp_help 't1'
