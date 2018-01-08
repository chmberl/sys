#!/bin/bash

PS3="选择功能数字： "

trap "MyExit;" INT TERM

# show_menu
# params array_index array_function
show_menu() {
  COLUMNS=1
  local all_done=0
  declare -a options=("${!1}")
  declare -a funcs=("${!2}")
  while (( !all_done )); do
    clear
    select opt in ${options[@]}
    do
      case $REPLY in
        'q')
          echo "已经返回/退出"
          all_done=1
          break;;
        *)
          ${funcs[$REPLY-1]} $opt
          break;;
      esac
    done
  done

}

restart_naoqi() {
  echo "重启Naoqi"
  nao restart
}

robot_motion() {
  echo "前进: w, 左转: a, 右转: d, 停止: s, 退出: q"
  while [[ 1 ]]
  do
    read -s -n 1 key
    key=`echo $key | cat -v`
    #判断输入了何种键
    if [[ $key == "W" || $key == "w" ]]; then         #W, w
        kill -25 $SUB_PID
    elif [[ $key == "S" || $key == "s" ]]; then       #S, s
        kill -28 $SUB_PID
    elif [[ $key == "A" || $key == "a" ]]; then        #A, a
        kill -26 $SUB_PID
    elif [[ $key == "D" || $key == "d" ]]; then       #D, d
        kill -27 $SUB_PID
    # elif [[ "[$key]" == "[ ]" ]]; then
    #     sig=$sigAllDown                               #空格键
    elif [[ $key == "J" || $key == "j" ]];then
        kill -29 $SUB_PID
    elif [[ $key == "H" || $key == "h" ]];then
        kill -24 $SUB_PID
    elif [[ $key == "L" || $key == "l" ]];then
        kill -31 $SUB_PID
    elif [[ $key == "K" || $key == "k" ]];then
        kill -30 $SUB_PID
    elif [[ $key == "Q" || $key == "q" ]];then         #Q, q
      kill -28 $SUB_PID
      break
    fi
  done
}

behavior() {
  qicli call ALBehaviorManager.startBehavior "chengdu"
}

qa() {
  words=("今天我们迎来了一位聪明机灵的机器人，刚刚大家已经看到他为局长递上营业执照了"
  "哦，原来是这样，那么高新自贸区具体将从哪几个方面进行改革创新呢"
  "你能否进一步为我们解读顶级科技园合伙人计划（TSPPP）的具体内容和实施路径"
  "那你知不知道自贸区的成立会对民生领域带来怎样的变化和好处"
  '如果需要退出，请输入字母：q')
  speaks=(qa1 qa2 qa3 qa4)
  show_menu words[@] speaks[@]
}

qa1() {
  qicli call ALBehaviorManager.startBehavior "chengduqa1"
}
qa2() {
  qicli call ALBehaviorManager.startBehavior "chengduqa2"
}
qa3() {
  qicli call ALBehaviorManager.startBehavior "chengduqa3"
}
qa4() {
  qicli call ALBehaviorManager.startBehavior "chengduqa4"
}

relax() {
  qicli call ALBehaviorManager.startBehavior "chengdurelax"
}

dance() {
  qicli call ALBehaviorManager.startBehavior "chengdudance"
}

end() {
  qicli call ALBehaviorManager.startBehavior "chengduend"
}

wakeUp() {
  qicli call ALMotion.wakeUp
}

MyExit() {
  echo "exit"
  echo "kill -9 $SUB_PID"
  kill -9 $SUB_PID
  stty $sTTY
  tput cnorm
  exit
}

sTTY=`stty -g`
optionss=("重启Naoqi" "移动机器人" "托举动作" "问答" "跳舞" "谢幕离场" "放松" "唤醒")
funcss=(restart_naoqi robot_motion behavior qa dance end relax wakeUp)

python robot_motion.py 2>/dev/null 1>/dev/null &
SUB_PID=$!
sleep 2
show_menu optionss[@] funcss[@]
