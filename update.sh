#!/bin/bash
python2 ./xkcd.py -o ./output update
cp -R includes output/includes
sed s/DATE/$(date +%Y%j)/ templates/manifest.webapp |
sed s/LATEST/$(ls output/*.html | wc -l)/ > output/manifest.webapp
sed s/NUMBER/$(ls output/*.html | wc -l)/ templates/script.js > output/script.js
cd output
zip ../xkcd-archive.zip *
