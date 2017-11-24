#!/bin/bash

if [ "$1" == "-h" ]; then
    echo "Usage: `basename $0`: (1) production (2) runs"
    exit 0;
fi

year="20${1:3:2}"
Path="/alice/sim/${year}/${1}/"
echo $Path
# alien_find -x collection "${searchpath} ${what}" > "${listname}"
for i in ${2}; do
    command="alien_find -x collection /alice/sim/${year}/${1}/${i}/* AliESDs.root > ${1}_${i}.xml"
    echo $command
    sleep 3
    eval $command
done
