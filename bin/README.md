This folder contains tippecanoe binaries distribution for Cloud Foundry cflinuxfs3 stack.
Building vector tilesets from geojson could be run as task in a Cloud Foundry setup. 


# Build tippecanoe binaries

```
docker build -t cflinuxfs3/tippecanoe:1.0 .
docker run -d cflinuxfs3/tippecanoe:1.0 --name tippecanoe
docker cp tippecanoe:/usr/local/bin/tippecanoe ./
docker cp tippecanoe:/usr/local/bin/tippecanoe-json-tool ./
docker cp tippecanoe:/usr/local/bin/tippecanoe-enumerate ./
docker cp tippecanoe:/usr/local/bin/tippecanoe-decode ./
docker cp tippecanoe:/usr/local/bin/tile-join ./
```


