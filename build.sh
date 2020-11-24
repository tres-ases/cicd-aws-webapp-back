#!/bin/bash
echo '...cleaning distribution folder'
rm -rf dist && mkdir dist && mkdir dist/layers && mkdir dist/tmp

echo '...building production libraries node_modules'
cd ./libs && rm -rf node_modules && npm install && tsc && cd ..

echo '...packaging layer'
cd ./src && claudia pack --force --output ../dist/tmp/layer.zip >> /dev/null && cd ..
unzip dist/tmp/layer.zip 'node_modules/*' -d dist/layers/nodejs/ >> /dev/null && rm -rf dist/tmp
cd ./dist/layers && zip -r9 ../layers.zip nodejs >> /dev/null && cd ../.. &&

echo '...building production source code node_modules'
cd ./src && rm -rf node_modules && npm install >> /dev/null && cd ..
cd ./src && tsc && cd ..
