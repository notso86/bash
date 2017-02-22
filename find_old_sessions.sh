#!/bin/bash

usage() {
  echo " -h to print this help screen"
  echo " -d for a \"dry run\" to see sessions"
  echo " -x to kill sessions and processes found"
  echo " -t to specify how many days old (IE 30 for 30 days and older)"
  echo " default days are 30 unless otherwise specified"
  echo ""
  echo " Example: $0 -x -t 60"
  echo ""
}

while getopts "t: :d :x :h" o; do
    case $o in
        t) days=${OPTARG};;
        d) exec="ps -t";;
        x) exec="pkill -9 -t";;
        h) usage; exit 1;;
    esac 
done 

if [ -z "${days}" ]; then
  days="30" 
fi 
if [ -z "${exec}" ]; then
  exec="ps -t" 
fi

for s in $(w -h | grep -v '^root' | awk '{print $2}'); do find /dev/$s -atime +$days -exec $exec $s \; ; done

