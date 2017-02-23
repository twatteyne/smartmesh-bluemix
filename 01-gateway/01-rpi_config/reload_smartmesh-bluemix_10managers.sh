#!/bin/bash

printf "smartmesh-bluemix update script for Raspberry Pi - v1\n"
printf "\n"

printf "stopping all screens... "
killall screen
printf "done.\n"

printf "removing all config files... "
rm -f  /home/pi/*.config
printf "done.\n"

#============================

printf "starting CLI screens... "
screen -d -m -S cli_manager01 /dev/ttyUSB2
screen -d -m -S cli_manager02 /dev/ttyUSB6
screen -d -m -S cli_manager03 /dev/ttyUSB10
screen -d -m -S cli_manager04 /dev/ttyUSB14
screen -d -m -S cli_manager05 /dev/ttyUSB18
screen -d -m -S cli_manager06 /dev/ttyUSB22
screen -d -m -S cli_manager07 /dev/ttyUSB26
screen -d -m -S cli_manager08 /dev/ttyUSB30
screen -d -m -S cli_manager09 /dev/ttyUSB34
screen -d -m -S cli_manager10 /dev/ttyUSB38
printf "done.\n"

#============================

printf "updating JsonServer instances\n"

printf "    removing old JsonServer code... "
rm -Rf /home/pi/smartmeshsdk-master
printf "done.\n"

printf "    downloading new JsonServer code... "
wget -q -O /home/pi/smartmeshsdk-master.zip https://github.com/twatteyne/smartmeshsdk/archive/master.zip
printf "done.\n"

printf "    unzipping new JsonServer code... "
unzip -q /home/pi/smartmeshsdk-master.zip
printf "done.\n"

printf "    starting JsonServer instances in a screen sessions... "
screen -S manager01_jsonserver -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8081 --serialport=/dev/ttyUSB3  --notifprefix=manager01 --configfilename=manager01.config
screen -S manager02_jsonserver -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8082 --serialport=/dev/ttyUSB7  --notifprefix=manager02 --configfilename=manager02.config
screen -S manager03_jsonserver -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8083 --serialport=/dev/ttyUSB11 --notifprefix=manager03 --configfilename=manager03.config
screen -S manager04_jsonserver -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8084 --serialport=/dev/ttyUSB15 --notifprefix=manager04 --configfilename=manager04.config
screen -S manager05_jsonserver -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8085 --serialport=/dev/ttyUSB19 --notifprefix=manager05 --configfilename=manager05.config
screen -S manager06_jsonserver -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8086 --serialport=/dev/ttyUSB23 --notifprefix=manager06 --configfilename=manager06.config
screen -S manager07_jsonserver -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8087 --serialport=/dev/ttyUSB27 --notifprefix=manager07 --configfilename=manager07.config
screen -S manager08_jsonserver -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8088 --serialport=/dev/ttyUSB31 --notifprefix=manager08 --configfilename=manager08.config
screen -S manager09_jsonserver -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8089 --serialport=/dev/ttyUSB35 --notifprefix=manager09 --configfilename=manager09.config
screen -S manager10_jsonserver -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8090 --serialport=/dev/ttyUSB39 --notifprefix=manager10 --configfilename=manager10.config
printf "done.\n"
