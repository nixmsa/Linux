<pre>
<h1> SCSCI Openfiler Lun Provision </h1>


<b>[root@ansible1 ~]# lsscsi --scsi_id -g</b>
[1:0:0:0]    cd/dvd  VBOX     CD-ROM           1.0   /dev/sr0   -  /dev/sg0
[2:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sda   -  /dev/sg1
[root@ansible1 ~]#<b>  iscsiadm -m discovery -t sendtargets -p 192.168.0.65:3260</b>
192.168.0.65:3260,1 iqn.2006-01.com.SAN01:tsn.8a5bc9bad359
10.0.2.19:3260,1 iqn.2006-01.com.SAN01:tsn.8a5bc9bad359
[root@ansible1 ~]#<b> iscsiadm -m node -T iqn.2006-01.com.SAN01:tsn.8a5bc9bad359 -p 192.168.0.65 -l</b>
Logging in to [iface: default, target: iqn.2006-01.com.SAN01:tsn.8a5bc9bad359, portal: 192.168.0.65,                        3260] (multiple)
Login to [iface: default, target: iqn.2006-01.com.SAN01:tsn.8a5bc9bad359, portal: 192.168.0.65,3260]                         successful.

[root@ansible1 ~]# <b> ls /dev/disk/by-id/scsi* | awk -F "scsi-" '{print $2}'</b>
14f504e46494c45524b31645277612d673839662d53637842
14f504e46494c45524d77477533682d6d5364302d30313359
[root@ansible1 ~]#


[root@ansible1 ~]#<b> lsscsi --scsi_id -g </b>
[1:0:0:0]    cd/dvd  VBOX     CD-ROM           1.0   /dev/sr0   -  /dev/sg0
[2:0:0:0]    disk    ATA      VBOX HARDDISK    1.0   /dev/sda   -  /dev/sg1
[3:0:0:0]    disk    OPNFILER VIRTUAL-DISK     0     /dev/sdb   14f504e46494c45524b31645277612d673839662d53637842  /dev/sg2
[3:0:0:1]    disk    OPNFILER VIRTUAL-DISK     0     /dev/sdc   14f504e46494c45524d77477533682d6d5364302d30313359  /dev/sg3
[root@ansible1 ~]#

 <b>yum install device-mapper-multipath 

root@ansible1 etc]# multipath -v2
[root@ansible1 etc]# multipath -ll </b>
mpath02 (14f504e46494c45524d77477533682d6d5364302d30313359) dm-4 OPNFILER,VIRTUAL-DISK
size=28G features='0' hwhandler='0' wp=rw
`-+- policy='service-time 0' prio=1 status=active
  `- 3:0:0:1 sdc 8:32 active ready running
mpath01 (14f504e46494c45524b31645277612d673839662d53637842) dm-3 OPNFILER,VIRTUAL-DISK
size=10G features='0' hwhandler='0' wp=rw
`-+- policy='service-time 0' prio=1 status=active
  `- 3:0:0:0 sdb 8:16 active ready running
[root@ansible1 etc]# cat multipath.conf
<b>blacklist {
wwid "*"
        }

blacklist_exceptions {
wwid "14f504e46494c45524b31645277612d673839662d53637842"
wwid "14f504e46494c45524d77477533682d6d5364302d30313359"
}

multipaths {
multipath {
        wwid "14f504e46494c45524b31645277612d673839662d53637842"
        alias mpath01
}

multipath {
        wwid "14f504e46494c45524d77477533682d6d5364302d30313359"
        alias mpath02
}
}
</b>
[root@ansible1 ~]# ll
total 24
-rwxr-xr-x  1 root root  205 Nov 14 17:58 adduser.sh
-rw-------. 1 root root 1585 Feb 24  2022 anaconda-ks.cfg
-rw-r--r--  1 root root   58 Jan 16 18:41 kpart-disk.sh
-rw-r--r--  1 root root   62 Nov 14 17:59 list1
-rw-r--r--  1 root root    8 Jan 16 18:36 partdata
-rw-r--r--  1 root root  634 Jan 16 18:32 parted-script.ksh
<b>[root@ansible1 ~]# bash parted-script.ksh debug partdata
partdata


parted -s /dev/mapper/mpath01 unit MiB -- mklabel gpt
parted -s /dev/mapper/mpath01 -- mkpart primary 0% 100%
parted -s /dev/mapper/mpath01 unit MiB -- print
ls -l /dev/mapper/mpath01* </b>
[root@ansible1 ~]# bash parted-script.ksh commit  partdata





[root@ansible1 ~]# ls -ltr /dev/mapper/
total 0
crw------- 1 root root 10, 236 Jan 16 17:34 control
lrwxrwxrwx 1 root root       7 Jan 16 17:34 cl-root -> ../dm-0
lrwxrwxrwx 1 root root       7 Jan 16 17:34 cl-swap -> ../dm-1
lrwxrwxrwx 1 root root       7 Jan 16 17:34 cl-home -> ../dm-2
lrwxrwxrwx 1 root root       7 Jan 16 18:05 mpath02 -> ../dm-4
lrwxrwxrwx 1 root root       7 Jan 16 18:39 mpath01 -> ../dm-3
lrwxrwxrwx 1 root root       7 Jan 16 18:42 mpath01p1 -> ../dm-5
<b>[root@ansible1 ~]# cat kpart-disk.sh
for dev in  mpath01
do
kpartx -a /dev/mapper/${dev}

done </b>
[root@ansible1 ~]#

[root@ansible1 ~]# vim partdata
<b>[root@ansible1 ~]# cat partdata
mpath02
[root@ansible1 ~]# bash parted-script.ksh debug partdata
partdata


parted -s /dev/mapper/mpath02 unit MiB -- mklabel gpt
parted -s /dev/mapper/mpath02 -- mkpart primary 0% 100%
parted -s /dev/mapper/mpath02 unit MiB -- print
ls -l /dev/mapper/mpath02*
[root@ansible1 ~]# bash parted-script.ksh commit  partdata
partdata </b>
Model: Linux device-mapper (multipath) (dm)
Disk /dev/mapper/mpath02: 28800MiB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start    End       Size      File system  Name     Flags
 1      1.00MiB  28799MiB  28798MiB               primary

[root@ansible1 ~]# cat kpart-disk.sh
for dev in  mpath02
do
kpartx -a /dev/mapper/${dev}

done
[root@ansible1 ~]# bash kpart-disk.sh




lrwxrwxrwx 1 root root 7 Jan 16 18:46 /dev/mapper/mpath02 -> ../dm-4
lrwxrwxrwx 1 root root 7 Jan 16 18:46 /dev/mapper/mpath02p1 -> ../dm-6
[root@ansible1 ~]#




<b>
bash parted-script.ksh debug partdata  
bash parted-script.ksh commit  partdata  
</b>







[root@ansible1 ~]# bash create_lvm_filesystem.sh debug lvm_filesystem_layout_data
create_lvm_filesystem.sh: line 1: !/bin/ksh: No such file or directory


# 2G oraclevg dblv /u01/app/oracle
/sbin/lvcreate -Zy -Wy --yes -L 2G -n dblv oraclevg
/bin/mkdir -p /u01/app/oracle
/sbin/mkfs.xfs /dev/oraclevg/dblv
/bin/mount /dev/mapper/oraclevg-dblv /u01/app/oracle
/dev/mapper/oraclevg-dblv /u01/app/oracle xfs defaults 0 0
/bin/chmod 755 /u01/app/oracle
/bin/chown root:sys /u01/app/oracle


# 2G oraclevg gridlv /u01/app/grid
/sbin/lvcreate -Zy -Wy --yes -L 2G -n gridlv oraclevg
/bin/mkdir -p /u01/app/grid
/sbin/mkfs.xfs /dev/oraclevg/gridlv
/bin/mount /dev/mapper/oraclevg-gridlv /u01/app/grid
/dev/mapper/oraclevg-gridlv /u01/app/grid xfs defaults 0 0
/bin/chmod 755 /u01/app/grid
/bin/chown root:sys /u01/app/grid


# 1G oraclevg oemlv /u01/app/oracle/agent
/sbin/lvcreate -Zy -Wy --yes -L 1G -n oemlv oraclevg
/bin/mkdir -p /u01/app/oracle/agent
/sbin/mkfs.xfs /dev/oraclevg/oemlv
/bin/mount /dev/mapper/oraclevg-oemlv /u01/app/oracle/agent
/dev/mapper/oraclevg-oemlv /u01/app/oracle/agent xfs defaults 0 0
/bin/chmod 755 /u01/app/oracle/agent
/bin/chown root:sys /u01/app/oracle/agent


# 1G oraclevg scriptlv /u01/app/oracle/script
/sbin/lvcreate -Zy -Wy --yes -L 1G -n scriptlv oraclevg
/bin/mkdir -p /u01/app/oracle/script
/sbin/mkfs.xfs /dev/oraclevg/scriptlv
/bin/mount /dev/mapper/oraclevg-scriptlv /u01/app/oracle/script
/dev/mapper/oraclevg-scriptlv /u01/app/oracle/script xfs defaults 0 0
/bin/chmod 755 /u01/app/oracle/script
/bin/chown root:sys /u01/app/oracle/script


# 2G oraclevg ogglv /u10
/sbin/lvcreate -Zy -Wy --yes -L 2G -n ogglv oraclevg
/bin/mkdir -p /u10
/sbin/mkfs.xfs /dev/oraclevg/ogglv
/bin/mount /dev/mapper/oraclevg-ogglv /u10
/dev/mapper/oraclevg-ogglv /u10 xfs defaults 0 0
/bin/chmod 755 /u10
/bin/chown root:sys /u10


[root@ansible1 ~]# bash create_lvm_filesystem.sh commit lvm_filesystem_layout_data
create_lvm_filesystem.sh: line 1: !/bin/ksh: No such file or directory
  Logical volume "dblv" created.
meta-data=/dev/oraclevg/dblv     isize=512    agcount=4, agsize=131072 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0, sparse=0
data     =                       bsize=4096   blocks=524288, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
  Logical volume "gridlv" created.
meta-data=/dev/oraclevg/gridlv   isize=512    agcount=4, agsize=131072 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0, sparse=0
data     =                       bsize=4096   blocks=524288, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
  Logical volume "oemlv" created.
meta-data=/dev/oraclevg/oemlv    isize=512    agcount=4, agsize=65536 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0, sparse=0
data     =                       bsize=4096   blocks=262144, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
  Logical volume "scriptlv" created.
meta-data=/dev/oraclevg/scriptlv isize=512    agcount=4, agsize=65536 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0, sparse=0
data     =                       bsize=4096   blocks=262144, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
  Logical volume "ogglv" created.
meta-data=/dev/oraclevg/ogglv    isize=512    agcount=4, agsize=131072 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0, sparse=0
data     =                       bsize=4096   blocks=524288, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
  Logical volume "oswatcherlv00" created.
meta-data=/dev/oraclevg/oswatcherlv00 isize=512    agcount=4, agsize=65536 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0, sparse=0
data     =                       bsize=4096   blocks=262144, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
[root@ansible1 ~]#

[root@ansible1 ~]# df -h
Filesystem                          Size  Used Avail Use% Mounted on
devtmpfs                            366M     0  366M   0% /dev
tmpfs                               378M     0  378M   0% /dev/shm
tmpfs                               378M  5.5M  373M   2% /run
tmpfs                               378M     0  378M   0% /sys/fs/cgroup
/dev/mapper/cl-root                  50G  2.0G   48G   4% /
/dev/sda1                          1014M  172M  843M  17% /boot
/dev/mapper/cl-home                  55G   33M   55G   1% /home
tmpfs                                76M     0   76M   0% /run/user/0
tmpfs                                76M     0   76M   0% /run/user/1000
/dev/mapper/oraclevg-dblv           2.0G   33M  2.0G   2% /u01/app/oracle
/dev/mapper/oraclevg-gridlv         2.0G   33M  2.0G   2% /u01/app/grid
/dev/mapper/oraclevg-oemlv         1014M   33M  982M   4% /u01/app/oracle/agent
/dev/mapper/oraclevg-scriptlv      1014M   33M  982M   4% /u01/app/oracle/script
/dev/mapper/oraclevg-ogglv          2.0G   33M  2.0G   2% /u10
/dev/mapper/oraclevg-oswatcherlv00 1014M   33M  982M   4% /oswatcher
[root@ansible1 ~]#


<b>[root@ansible1 ~]# cat lvm_filesystem_layout_data
2G     oraclevg  dblv          /u01/app/oracle         755 root:sys
2G     oraclevg  gridlv        /u01/app/grid           755 root:sys
1G     oraclevg  oemlv         /u01/app/oracle/agent   755 root:sys
1G     oraclevg  scriptlv      /u01/app/oracle/script  755 root:sys
2G     oraclevg  ogglv         /u10                    755 root:sys
1G     oraclevg  oswatcherlv00 /oswatcher              755 root:sys
[root@ansible1 ~]# cat create_lvm_filesystem.sh
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
</b>
[root@ansible1 ~]# df -h
Filesystem                          Size  Used Avail Use% Mounted on
devtmpfs                            366M     0  366M   0% /dev
tmpfs                               378M     0  378M   0% /dev/shm
tmpfs                               378M  5.5M  373M   2% /run
tmpfs                               378M     0  378M   0% /sys/fs/cgroup
/dev/mapper/cl-root                  50G  2.0G   48G   4% /
/dev/sda1                          1014M  172M  843M  17% /boot
/dev/mapper/cl-home                  55G   33M   55G   1% /home
tmpfs                                76M     0   76M   0% /run/user/0
tmpfs                                76M     0   76M   0% /run/user/1000
/dev/mapper/oraclevg-dblv           2.0G   33M  2.0G   2% /u01/app/oracle
/dev/mapper/oraclevg-gridlv         2.0G   33M  2.0G   2% /u01/app/grid
/dev/mapper/oraclevg-oemlv         1014M   33M  982M   4% /u01/app/oracle/agent
/dev/mapper/oraclevg-scriptlv      1014M   33M  982M   4% /u01/app/oracle/script
/dev/mapper/oraclevg-ogglv          2.0G   33M  2.0G   2% /u10
/dev/mapper/oraclevg-oswatcherlv00 1014M   33M  982M   4% /oswatcher
[root@ansible1 ~]# cat create_lvm_filesystem.sh


</pre>
