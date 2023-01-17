!/bin/ksh
# fs_create_xfs
debug=$1
lvm_filesystem_layout_data=$2
while read size vg lv fs perm owner
do
if [ "$debug" = "commit" ]; then
  /sbin/lvcreate -Zy -Wy --yes -L ${size} -n ${lv} ${vg}
  /bin/mkdir -p ${fs}
  /sbin/mkfs.xfs /dev/${vg}/${lv}
# /sbin/tune2fs -c0 -i0 /dev/${vg}/${lv}
  /bin/mount /dev/mapper/${vg}-${lv} ${fs}
  echo -e "/dev/mapper/${vg}-${lv}  ${fs}  xfs  defaults 0 0" >> /etc/fstab
  /bin/chmod ${perm} ${fs}
  /bin/chown ${owner} ${fs}
else
  echo -e "\n"
  echo -e "# ${size} ${vg} ${lv} ${fs}"
  echo -e /sbin/lvcreate -Zy -Wy --yes -L ${size} -n ${lv} ${vg}
  echo -e /bin/mkdir -p ${fs}
  echo -e /sbin/mkfs.xfs /dev/${vg}/${lv}
# echo -e /sbin/tune2fs -c0 -i0 /dev/${vg}/${lv}
  echo -e /bin/mount /dev/mapper/${vg}-${lv} ${fs}
  echo -e /dev/mapper/${vg}-${lv}  ${fs}   xfs  defaults 0 0
  echo -e /bin/chmod ${perm} ${fs}
  echo -e /bin/chown ${owner} ${fs}
fi
done <"${lvm_filesystem_layout_data}"
