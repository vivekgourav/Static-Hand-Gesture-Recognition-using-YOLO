#!/bin/bash
aa="stop"
ab="go"
ac="left"
ad="right"
grep -E "\b(stop|go|left|right)\b" -o results.txt >keywords.txt
tail -1 keywords.txt >sign.txt
input="sign.txt"
while :
do
while IFS= read -r line
do

	if [ "$line" == "$aa" ]
	 then 
	  echo "stop"
	  echo "cansend can0 123#00"
          cansend can0 123#00


	elif [ "$line" == "$ab" ]
	 then 
          echo "go"
          echo "cansend can0 123#02"
          cansend can0 123#02

	elif [ "$line" == "$ac" ] 
	 then 
	  echo "left"
	  echo "cansend can0 123#01"
          cansend can0 123#01
	
	#if [ "$line" == "$ad" ] then 
	else
	  echo "right"
	  echo "cansend can0 123#03"
          cansend can0 123#03
        
             fi
done < "$input"
grep -E "\b(stop|go|left|right)\b" -o results.txt >keywords.txt
tail -1 keywords.txt >sign.txt 
done





