#!/bin/bash

OUTPUT=${HOME}/cd-ripper

if [[ ! -e /usr/bin/cdparanoia ]]; then
	sudo apt -y install cdparanoia
fi

if [[ ! -e /usr/bin/lame ]]; then
	sudo apt -y install lame
fi

if [[ ! -e /usr/bin/espeak ]]; then
	sudo apt -y install espeak
fi

mkdir -p /tmp/cdparanoia
cd /tmp/cdparanoia

cdparanoia -vsZB

for file in *.wav; do 
	lame -h -b 192 ${file}; 
done

mkdir -p ${OUTPUT}
mv *.mp3 ${OUTPUT}

echo "Output directory: "${OUTPUT}
espeak "CD ripper has been finished"
