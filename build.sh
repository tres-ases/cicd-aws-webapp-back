#!/bin/bash
echo '...cleaning distribution folder'
rm -rf dist && mkdir dist && mkdir dist/tmp

echo '...building production source code node_modules'
cd ./src && rm -rf node_modules && npm install >> /dev/null && cd ..
cd ./src && tsc && cd ..
