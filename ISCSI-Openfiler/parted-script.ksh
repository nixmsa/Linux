#!/bin/ksh
# create_part
debug=$1
partdata=$2
echo $partdata
while read disk
do
if [ "$debug" = "commit" ]; then
   parted -s /dev/mapper/${disk} unit MiB -- mklabel gpt
   parted -s /dev/mapper/${disk} -- mkpart primary 0% 100%
   parted -s /dev/mapper/${disk} unit MiB -- print
   parted -s /dev/mapper/${disk} align-check opt 1
   ls -l /dev/mapper/${disk}*
else
  echo -e "\n"
  echo -e "parted -s /dev/mapper/${disk} unit MiB -- mklabel gpt"
  echo -e "parted -s /dev/mapper/${disk} -- mkpart primary 0% 100%"
  echo -e "parted -s /dev/mapper/${disk} unit MiB -- print"
  echo -e "ls -l /dev/mapper/${disk}*"
fi
done < $partdata
