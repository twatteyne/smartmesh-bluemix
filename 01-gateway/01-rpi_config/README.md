TODO

```
sudo apt-get install dos2unix
```

on `openpi-1`:
```
export WATSON_MANAGER=00-17-0d-00-00-58-2f-e4
```

on `openpi-ucl`:
```
export WATSON_MANAGER=00-17-0d-00-00-60-37-b3
```

In `.node-red/settings.js`, change:

```
//flowFile: 'flows.json',
```

to 

```
flowFile: 'flows_bluemix.json',
```

```
wget -O ~/update_smartmesh-bluemix.sh https://raw.githubusercontent.com/twatteyne/smartmesh-bluemix/master/01-gateway/01-rpi_config/update_smartmesh-bluemix.sh
dos2unix ~/update_smartmesh-bluemix.sh
chmod u+x ~/update_smartmesh-bluemix.sh
~/update_smartmesh-bluemix.sh
```