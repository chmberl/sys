#########################################################################
# File Name: test.sh
# Author: exit0
# mail: chmbel@gmail.com
# Created Time: 2015-03-09 16:38
#########################################################################

#!/bin/ksh
get_a_char_from_tty()
{
    SAVEDSTTY=`stty -g`
    stty -echo
    stty raw
    dd if=/dev/tty bs=1 count=1 2> /dev/null
    stty -raw
    stty echo
    stty $SAVEDSTTY
}

c=`get_a_char_from_tty | cat -v`
case "$c" in
'^M' ) echo "enter" ;;
'^[' ) echo "possible arrow keys"
        secondchar=`get_a_char_from_tty`
        thirdchar=`get_a_char_from_tty`
        case "$thirdchar" in
            'A' ) echo UP ;;
            'B' ) echo DOWN ;;
            'D' ) echo LEFT ;;
            'C' ) echo RIGHT ;;
        esac
        ;;
    *) echo "hello world";;
esac
