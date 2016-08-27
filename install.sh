#!/bin/bash

echo "Using \$HOME: $HOME"
for file in $(git ls-files | grep -E '^home/USER')
do
        target=$(echo $file | sed "s@home/USER@$HOME@")
        set -x
        install -D $file $target 
        set +x
done
