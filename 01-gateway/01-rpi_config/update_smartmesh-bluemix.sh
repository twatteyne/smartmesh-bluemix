#!/bin/bash

printf "smartmesh-bluemix update script for Raspberry Pi - v1\n"
printf "\n"

#============================

printf "updating JsonServer\n"

printf "    killing screen... "
screen -X -S jsonserver quit
printf "done.\n"

printf "    removing old JsonServer code... "
rm -Rf ~/smartmeshsdk-master
printf "done.\n"

printf "    downloading new JsonServer code... "
wget -q -O ~/smartmeshsdk-master.zip https://github.com/twatteyne/smartmeshsdk/archive/master.zip
printf "done.\n"

printf "    unzipping new JsonServer code... "
unzip -q ~/smartmeshsdk-master.zip
printf "done.\n"

printf "    starting new JsonServer in a screen session... "
screen -S jsonserver -d -m python python /home/pi/smartmeshsdk-master/app/JsonServer/JsonServer.py --serialport=/dev/ttyUSB3
printf "done.\n"

#============================

printf "updating Node-RED\n"

printf "    stopping Node-RED... "
node-red-stop
printf "done.\n"

printf "    downloading new Node-RED flow... "
wget -q -O ~/.node-red/flows_raspberrypi.json https://raw.githubusercontent.com/twatteyne/smartmesh-bluemix/master/01-gateway/02-node-red/flows.json
printf "done.\n"

printf "    changing new Node-RED flow to connect as manager "$WATSON_MANAGER"... "
sed -i 's/00-17-0d-00-00-58-2f-e4/'$WATSON_MANAGER'/g' ~/.node-red/flows_raspberrypi.json
printf "done.\n"

printf "    starting Node-RED... "
node-red-start &
printf "done.\n"
