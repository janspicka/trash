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
