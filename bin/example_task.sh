#!/bin/sh

if [ -n $VCAP_SERVICES ]
then
  DATA=$(echo $VCAP_SERVICES | jq -r '.smb[0].volume_mounts[0].container_dir')

  curl -L -O https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_countries.zip
  unzip ne_10m_admin_0_countries.zip
  ogr2ogr -f GeoJSON ne_10m_admin_0_countries.geojson ne_10m_admin_0_countries.shp

  curl -L -O https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_1_states_provinces.zip
  unzip -o ne_10m_admin_1_states_provinces.zip
  ogr2ogr -f GeoJSON ne_10m_admin_1_states_provinces.geojson ne_10m_admin_1_states_provinces.shp

  bin/tippecanoe -z3 -o countries-z3.mbtiles --coalesce-densest-as-needed ne_10m_admin_0_countries.geojson
  bin/tippecanoe -zg -Z4 -o states-Z4.mbtiles --coalesce-densest-as-needed --extend-zooms-if-still-dropping ne_10m_admin_1_states_provinces.geojson
  bin/tile-join -o $DATA/states-countries.mbtiles countries-z3.mbtiles states-Z4.mbtiles
else
  echo "Should be run when a volume service is bounded"
fi
