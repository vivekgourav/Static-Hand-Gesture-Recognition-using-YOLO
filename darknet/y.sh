#!/bin/bash

sudo modprobe can
sudo modprobe can_raw
sudo modprobe can_dev
sudo modprobe mttcan
sudo ip link set can0 type can bitrate 500000
sudo ip link set up can0
sudo ifconfig can0 txqueuelen 1000

#./darknet detector demo data/obj.data cfg/yolov3_custom.cfg yolov3_custom.weights "nvarguscamerasrc ! video/x-raw(memory:NVMM), width=(int)1280, height=(int)720,format=(string)NV12, framerate=(fraction)30/1 ! nvvidconv flip-method=0 ! video/x-raw, format=(string)BGRx ! videoconvert ! video/x-raw, format=(string)BGR ! appsink" >result.txt
#./darknet detector demo data/obj.data cfg/yolov3_tiny.cfg yolov3_tiny.weights data/40.mp4 >result.txt

#./darknet detector demo data/obj.data cfg/yolov3_custom.cfg yolov3_custom.weights http://192.168.0.107:8080/video?dummy=param.mjpg -i 0 >result.txt

#./darknet detector demo data/obj.data cfg/yolov3_tiny.cfg yolov3_tiny.weights "nvarguscamerasrc ! video/x-raw(memory:NVMM), width=(int)1280, height=(int)720,format=(string)NV12, framerate=(fraction)30/1 ! nvvidconv flip-method=0 ! video/x-raw, format=(string)BGRx ! videoconvert ! video/x-raw, format=(string)BGR ! appsink" >result.txt



#./darknet detector demo data/obj.data cfg/yolov4_custom.cfg yolov4_custom.weights data/40.mp4

#./darknet detector demo data/obj.data cfg/yolov3_tiny.cfg yolov3_tiny.weights "nvarguscamerasrc ! video/x-raw(memory:NVMM), width=(int)1280, height=(int)720,format=(string)NV12, framerate=(fraction)30/1 ! nvvidconv flip-method=0 ! video/x-raw, format=(string)BGRx ! videoconvert ! video/x-raw, format=(string)BGR ! appsink" >results.txt

#./darknet detector demo data/obj.data cfg/yolov3_tiny.cfg yolov3_tiny.weights data/final2.mp4>results.txt
./darknet detector demo data/obj.data cfg/yolov3_tiny.cfg yolov3_tiny.weights http://192.168.0.100:8080/video?dummy=param.mjpg -i 0 >results.txt
