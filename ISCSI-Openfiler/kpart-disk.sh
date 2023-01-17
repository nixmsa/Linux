for dev in  mpath02
do
kpartx -a /dev/mapper/${dev}

done
