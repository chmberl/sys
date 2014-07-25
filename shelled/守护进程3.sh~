 cat schedule.sh 
#!/bin/bash
##############################################
# $Author: netkiller $
# $Id: shell.xml 449 2012-08-10 10:38:08Z netkiller $
# http://netkiller.github.io
##############################################
NAME=schedule
BASEDIR='/www'
PROG=$(basename $0)
LOGFILE=/var/tmp/$NAME.log
PIDFILE=/var/tmp/$NAME.pid
##############################################
PHP="/srv/php/bin/php -c /srv/php/etc/php.cli.ini"
##############################################
#echo $$
#echo $BASHPID
cd $BASEDIR
 
function run(){
        <span></span> 任务写这里
}
function start(){
    if [ -f "$PIDFILE" ]; then
        echo $PIDFILE
        exit 2
    fi
 
    for (( ; ; ))
    do
        run
    done &
    echo $! > $PIDFILE
}
function stop(){
    [ -f $PIDFILE ] && kill `cat $PIDFILE` && rm -rf $PIDFILE
}
function status(){
    ps ax | grep $PROG | grep -v grep | grep -v status
}
function reset(){
    pkill $PROG
    [ -f $PIDFILE ] && rm -rf $PIDFILE
}
case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  status)
    status
    ;;
  restart)
    stop
    start
    ;;
  reset)
    reset
    ;;
  *)
    echo $"Usage: $0 {start|stop|status|restart|reset}"
    exit 2
esac
 
exit $?
