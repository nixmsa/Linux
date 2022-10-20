#!/bin/ksh
# fs_create_xfs
debug=$1
fs_data=$2
while read queue ips
do
if [ "$debug" = "commit" ]; then
   lpadmin -p${queue} -D"${queue}" -vsocket://${ips}:9100 -E
else
   lpadmin -p${queue} -D"${queue}" -vsocket://${ips}:9100 -E
fi
done <"${fs_data}"
