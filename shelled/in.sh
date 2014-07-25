if [ ! -p pipe1 ]
then
	mknod pipe1 p
fi

while true
do
	read msg
	if [ "$msg"="" ]
	then
		continue
	else
		echo "$msg"
	fi
done <pipe1
