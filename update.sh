#!/bin/bash

echo "Using \$HOME: $HOME"
for file in $(git ls-files | grep -E '^home/uberj')
do
        target=$(echo $file | sed "s@home/uberj@$HOME@")
        set -x
        cp $target $file
        set +x
done
