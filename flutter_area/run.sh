#!/bin/bash

PORT=8081

echo 'Preparing port' $PORT '...'

cd build/web/

echo 'Server starting on port' $PORT '...'

python3 -m http.server $PORT