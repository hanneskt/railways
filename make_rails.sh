cd data

echo "[O] Getting all rail route id's"
osmium tags-filter belgium-full.osm.pbf r/route=train -f opl | grep "^r" | cut -d' ' -f1 > passenge_rail_route_ids.txt

# get all route relations (from the id's) and get ALL their children or references
# this includes all the nodes on the rails
echo "[O] Getting all objects on the rail routes"
osmium getid -r -i passenge_rail_route_ids.txt belgium-full.osm.pbf -o all_passenger_rail_objects.osm.pbf --overwrite

# only passenger rails
echo "[O] extracting passenger rails"
osmium tags-filter all_passenger_rail_objects.osm.pbf w/railway=rail -o passenger_railways.osm.pbf --overwrite
osmium export passenger_railways.osm.pbf -o passenger_railways.geojson --overwrite

# only passenger stops
echo "[O] extracting passenger stops"
osmium tags-filter all_passenger_rail_objects.osm.pbf n/railway=stop -o passenger_stops.osm.pbf --overwrite
osmium export passenger_stops.osm.pbf -o passenger_stops.geojson --overwrite
