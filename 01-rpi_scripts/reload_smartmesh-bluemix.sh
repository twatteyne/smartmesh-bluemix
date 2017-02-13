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
screen -S jsonserver -d -m python ~/smartmeshsdk-master/app/JsonServer/JsonServer.py
printf "done.\n"

printf "    waiting for JsonServer to run"
until $(curl --output /dev/null --silent --head --fail http://127.0.0.1:8080/api/v1/status); do
    printf '.'
    sleep 1
done
printf "done.\n"

printf "    configuring JsonServer... "
curl -H 'Content-Type: application/json' -X PUT -d '{ "managers": ["/dev/ttyUSB3"] }' http://127.0.0.1:8080/api/v1/config/managers
printf "done.\n"

#============================

printf "updating Node-RED\n"

printf "    stopping Node-RED... "
node-red-stop
printf "done.\n"

printf "    downloading new Node-RED flow... "
wget -q -O ~/.node-red/flows_raspberrypi.json https://raw.githubusercontent.com/twatteyne/smartmesh-bluemix/master/02-node-red/flows.json
printf "done.\n"

printf "    starting Node-RED... "
node-red-start &
printf "done.\n"