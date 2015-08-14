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

disk init name = 'my_evice1', physname='/u01/app/sybase/SYB15.7/data/my_device1.dbf', size = '10M'



