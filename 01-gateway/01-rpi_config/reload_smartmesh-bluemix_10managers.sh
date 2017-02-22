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
screen -d -m -S manager1_cli  /dev/ttyUSB2
screen -d -m -S manager2_cli  /dev/ttyUSB6
screen -d -m -S manager3_cli  /dev/ttyUSB10
screen -d -m -S manager4_cli  /dev/ttyUSB14
screen -d -m -S manager5_cli  /dev/ttyUSB18
screen -d -m -S manager6_cli  /dev/ttyUSB22
screen -d -m -S manager7_cli  /dev/ttyUSB26
screen -d -m -S manager8_cli  /dev/ttyUSB30
screen -d -m -S manager9_cli  /dev/ttyUSB34
screen -d -m -S manager10_cli /dev/ttyUSB38
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
screen -S manager1_jsonserver  -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8081 --serialport=/dev/ttyUSB3  --notifprefix=manager1 --configfilename=manager1.config
screen -S manager2_jsonserver  -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8082 --serialport=/dev/ttyUSB7  --notifprefix=manager2 --configfilename=manager2.config
screen -S manager3_jsonserver  -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8083 --serialport=/dev/ttyUSB11 --notifprefix=manager3 --configfilename=manager3.config
screen -S manager4_jsonserver  -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8084 --serialport=/dev/ttyUSB15 --notifprefix=manager4 --configfilename=manager4.config
screen -S manager5_jsonserver  -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8085 --serialport=/dev/ttyUSB19 --notifprefix=manager5 --configfilename=manager5.config
screen -S manager6_jsonserver  -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8086 --serialport=/dev/ttyUSB23 --notifprefix=manager6 --configfilename=manager6.config
screen -S manager7_jsonserver  -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8087 --serialport=/dev/ttyUSB27 --notifprefix=manager7 --configfilename=manager7.config
screen -S manager8_jsonserver  -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8088 --serialport=/dev/ttyUSB31 --notifprefix=manager8 --configfilename=manager8.config
screen -S manager9_jsonserver  -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8089 --serialport=/dev/ttyUSB35 --notifprefix=manager9 --configfilename=manager9.config
screen -S manager10_jsonserver -d -m python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --tcpport=8090 --serialport=/dev/ttyUSB39 --notifprefix=manager0 --configfilename=manager10.config
printf "done.\n"
