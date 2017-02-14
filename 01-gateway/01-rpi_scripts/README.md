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

```
wget -O ~/reload_smartmesh-bluemix.sh https://raw.githubusercontent.com/twatteyne/smartmesh-bluemix/master/01-rpi_scripts/reload_smartmesh-bluemix.sh
dos2unix ~/reload_smartmesh-bluemix.sh
chmod u+x ~/reload_smartmesh-bluemix.sh
~/reload_smartmesh-bluemix.sh
```