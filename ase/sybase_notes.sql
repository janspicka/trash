# promenne v prostredi  
. skript.sh
env 



# neco s ase 


cd /u01/app/sybase/SYB15.7
. SYBASE.sh 
env | grep SYBASE

cd $SYBASE/$SYBASE_ASE/install 
startserver -r 
