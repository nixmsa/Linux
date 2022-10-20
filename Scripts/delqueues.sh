#!/bin/ksh
# fs_create_xfs
debug=$1
del_data=$2
while read queue 
do
if [ "$debug" = "commit" ]; then
   lpadmin -x ${queue} 
else
   lpadmin -x ${queue} 
fi
done <"${del_data}"
