#! /system/bin/sh
#echo "record test"
spk=1
rec=2
mic1=3
mic2=4
playback=5
playback_rcv=6
mic1_record=7
mic2_record=8
enable=1
disable=0
open="-Y"
close="-N"
pname_play="tinycap"
pbname="loopbacktest"


if test $2 -eq $enable
then
	loopbacktest $open "$1" 13
	if test $1 -eq $playback -o $1 -eq $playback_rcv
	then
		echo "playback test!"
	else
	tinycap /sdcard/miccapture.wav -c 1 -r 48000
	fi
elif test $2 -eq $disable
then
	if test $1 -eq $playback -o $1 -eq $playback_rcv
	then
	pkill -f $pbname
	loopbacktest $close "$1"
	else
	#pkill -f $pname_play
	loopbacktest $close "$1"
	fi
else
	echo "input error ctl cmd!"
fi
