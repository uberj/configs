#!/bin/bash

echo "Using \$HOME: $HOME"
for file in $(git ls-files | grep -E '^home/USER')
do
	target=$(echo $file | sed "s@home/USER@$HOME@")
	set -x
	if [[ "$OSTYPE" == "linux-gnu" ]]; then
		install -d $file $target 
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		# Mac OSX
		ginstall -D $file $target 
	fi
	set +x
done
