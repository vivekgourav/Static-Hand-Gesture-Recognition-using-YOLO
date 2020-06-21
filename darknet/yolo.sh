#!/bin/bash

sudo modprobe can
sudo modprobe can_raw
sudo modprobe can_dev
sudo modprobe mttcan
sudo ip link set can0 type can bitrate 500000
sudo ip link set up can0

./darknet detector demo data/obj.data cfg/yolov3_custom.cfg yolov3_custom.weights "nvarguscamerasrc ! video/x-raw(memory:NVMM), width=(int)1280, height=(int)720,format=(string)NV12, framerate=(fraction)30/1 ! nvvidconv flip-method=0 ! video/x-raw, format=(string)BGRx ! videoconvert ! video/x-raw, format=(string)BGR ! appsink" >result.txt


aa="stop"
ab="go"
ac="left"
ad="right"

grep -E "\b(stop|go|left|right)\b" -o result.txt >keywords.txt
tail -1 keywords.txt >sign.txt
input="sign.txt"
while :
do
while IFS= read -r line
do

	if [ "$line" == "$aa" ]
	 then 
	  echo "stop"
	  echo "cansend can0 666#01"
          cansend can0 666#01


	elif [ "$line" == "$ab" ]
	 then 
          echo "go"
          echo "cansend can0 666#02"
          cansend can0 666#00

	elif [ "$line" == "$ac" ] 
	 then 
	  echo "left"
	  echo "cansend can0 666#03"
          cansend can0 666#00
	
	#if [ "$line" == "$ad" ] then 
	else
	  echo "right"
	  echo "cansend can0 666#04"
          cansend can0 666#00
        
             fi
done < "$input"
grep -E "\b(stop|go|left|right)\b" -o result.txt >keywords.txt
tail -1 keywords.txt >sign.txt 
done
