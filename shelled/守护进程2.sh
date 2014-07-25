守护进程的shell--tipserver
 
1：可以直接关掉终端，在后台运行
2：可以查询服务的状态
 
3：可以定时启动需要运行的程序（范例为17点启动）
 
4：可以在运行时避免重复启动
tipserver
 
#!/bin/sh
 
run_main_programer()
{
while true
do
if [ "$date_hour" = '17' ]
then
as=`date +'%Y%m%d_%H%M%S'`
sh ./control_sh.sh >log/control_sh_$as.log
sleep 3600
fi
sleep 300
date_hour=`date +'%H'`
done
}
 
 
myself=`echo $0 | sed 's/^\.\///g'`
 
 
if [ $# -eq 0 ]
then
  echo "Unknown command option"
  echo "Usage::"
  echo "       $myself start | stop | status"
  exit
fi
 
 
case "x$1"
in
xstart)
#当前后台运行的线程列表
thread=`ps -ef | grep -v grep | grep -w "$myself" | grep "start" | awk '{ print $2 }'`
#只有本线程运行
if [ "$thread" = "$$" ]
then
nohup sh $myself start >/dev/null &
sleep 3
echo "The $myself have been started."
else
#取得父线程号
father_thread=`ps -ef | grep -v grep | grep "$myself" | grep "start" | grep "$$" | awk '{ print $3 }'`
#当前线程的父线程存在
if [ `ps -ef | grep -v grep | grep "$myself" | grep "start" | grep "$father_thread" | wc -l` -eq 2 ]
then
run_main_programer
fi
echo "The $myself is running."
fi
;;
xstop)
thread=`ps -ef | grep -v grep | grep "$myself" | grep "start" | awk '{ print $2 }'`
if [ -n "$thread" ]
then
kill -9 ${thread} 2>/dev/null
fi
echo "The $myself have been stoped."
;;
xstatus)
thread=`ps -ef | grep -v grep | grep "$myself" | grep "start" | awk '{ print $2 }'`
if [ -n "$thread" ]
then
echo "The $myself is running."
else
echo "The $myself is not running."
fi
;;
*)
echo '  Error parameter.'
esac
