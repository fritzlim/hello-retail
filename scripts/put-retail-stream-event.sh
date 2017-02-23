#!/usr/bin/env bash

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]
  then
    echo "usage: put-retail-stream-event <stage> <partition-key> <event-file>"
    exit 1
fi

if [ ! -e $3 ]
  then
    echo "file $3 does not exist"
    exit 1
fi

json_data=`cat $3`

aws kinesis put-record --stream-name $1RetailStream --data "${json_data//\"/\\\"}" --partition-key $2

