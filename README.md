# RAILS

## To make the data for the map, follow these steps

download the osm data for belgium (~650MB)

```bash
mkdir data
wget https://download.geofabrik.de/europe/belgium-latest.osm.pbf -o data/belgium.osm.pbf
```

generate the files used by the site

```bash
bash make_rails.sh
```

use something to serve them

```bash
python -m http.server
```

open http://0.0.0.0:8000/
