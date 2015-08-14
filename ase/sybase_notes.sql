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
go 

select * from master.dbo.sysdatabases
go

sp_who 
go


if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then                                                
        eval "`dircolors -b`"                                                                              
        alias ls='ls --color=auto'                                                                         
        alias grep='grep --color=auto'                                                                     
        fi                                                                                                           
export PS1="\[\e[36;1m\]\u\[\e[34;1m\]@\[\e[32;1m\]\H\[\e[34;1m\]: \[\e[31;1m\]\W \[\e[0m\]"  
alias fuck='sudo $(history -p \!\!)'
