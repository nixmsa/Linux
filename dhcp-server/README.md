<pre>
<h1> DHCP SERVER </h1>

<b>root@k8s:~# apt -y install isc-dhcp-server</b>
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libirs-export161 libisccfg-export163
Suggested packages:
  isc-dhcp-server-ldap policycoreutils
The following NEW packages will be installed:
  isc-dhcp-server libirs-export161 libisccfg-export163
0 upgraded, 3 newly installed, 0 to remove and 130 not upgraded.
Need to get 455 kB/528 kB of archives.
After this operation, 1,546 kB of additional disk space will be used.
Get:1 http://ca.archive.ubuntu.com/ubuntu jammy-updates/main amd64 isc-dhcp-server amd64 4.4.1-2.3ubuntu2.3 [455 kB]
Fetched 455 kB in 1s (491 kB/s)
Preconfiguring packages ...
Selecting previously unselected package libisccfg-export163.
(Reading database ... 73328 files and directories currently installed.)
Preparing to unpack .../libisccfg-export163_1%3a9.11.19+dfsg-2.1ubuntu3_amd64.deb ...
Unpacking libisccfg-export163 (1:9.11.19+dfsg-2.1ubuntu3) ...
Selecting previously unselected package libirs-export161.
Preparing to unpack .../libirs-export161_1%3a9.11.19+dfsg-2.1ubuntu3_amd64.deb ...
Unpacking libirs-export161 (1:9.11.19+dfsg-2.1ubuntu3) ...
Selecting previously unselected package isc-dhcp-server.
Preparing to unpack .../isc-dhcp-server_4.4.1-2.3ubuntu2.3_amd64.deb ...
Unpacking isc-dhcp-server (4.4.1-2.3ubuntu2.3) ...
Setting up libisccfg-export163 (1:9.11.19+dfsg-2.1ubuntu3) ...
Setting up libirs-export161 (1:9.11.19+dfsg-2.1ubuntu3) ...
Setting up isc-dhcp-server (4.4.1-2.3ubuntu2.3) ...
Generating /etc/default/isc-dhcp-server...
Created symlink /etc/systemd/system/multi-user.target.wants/isc-dhcp-server.service → /lib/systemd/system/isc-dhcp-server.service.
Created symlink /etc/systemd/system/multi-user.target.wants/isc-dhcp-server6.service → /lib/systemd/system/isc-dhcp-server6.service.
Processing triggers for libc-bin (2.35-0ubuntu3.1) ...
Processing triggers for man-db (2.10.2-1) ...
Scanning processes...
Scanning linux images...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
root@k8s:~#




***
root@k8s:~# netstat -rn
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         192.168.56.1    0.0.0.0         UG        0 0          0 enp0s8
0.0.0.0         192.168.0.1     0.0.0.0         UG        0 0          0 enp0s3
192.168.0.0     0.0.0.0         255.255.255.0   U         0 0          0 enp0s3
192.168.56.0    0.0.0.0         255.255.255.0   U         0 0          0 enp0s8
root@k8s:~# cat /etc/netplan/00-installer-config.yaml
network:
  ethernets:
    enp0s3:
      addresses: [192.168.0.171/24]
      gateway4: 192.168.0.1
      nameservers:
        addresses: [4.2.2.2, 8.8.8.8]
    enp0s8:
      addresses: [192.168.56.4/24]
      gateway4: 192.168.56.1
      nameservers:
        addresses: [4.2.2.2, 8.8.8.8]
  version: 2


***
<b>root@k8s:~# cat /etc/default/isc-dhcp-server</b>
# Defaults for isc-dhcp-server (sourced by /etc/init.d/isc-dhcp-server)

# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
#DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
#DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
#DHCPDv4_PID=/var/run/dhcpd.pid
#DHCPDv6_PID=/var/run/dhcpd6.pid

# Additional options to start dhcpd with.
#       Don't use options -cf or -pf here; use DHCPD_CONF/ DHCPD_PID instead
#OPTIONS=""

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
<b>INTERFACESv4="enp0s8"</b>
INTERFACESv6=""
root@k8s:~#

root@k8s:~# cat /etc/default/isc-dhcp-server
# Defaults for isc-dhcp-server (sourced by /etc/init.d/isc-dhcp-server)

# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
#DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
#DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
#DHCPDv4_PID=/var/run/dhcpd.pid
#DHCPDv6_PID=/var/run/dhcpd6.pid

# Additional options to start dhcpd with.
#       Don't use options -cf or -pf here; use DHCPD_CONF/ DHCPD_PID instead
#OPTIONS=""

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="enp0s8"
INTERFACESv6=""
root@k8s:~# /etc/dhcp/dhcpd.conf
-bash: /etc/dhcp/dhcpd.conf: Permission denied
root@k8s:~# vim /etc/dhcp/dhcpd.conf
root@k8s:~# sudo systemctl start isc-dhcp-server
root@k8s:~# sudo systemctl enable isc-dhcp-server
Synchronizing state of isc-dhcp-server.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable isc-dhcp-server
root@k8s:~# sudo systemctl status isc-dhcp-server
● isc-dhcp-server.service - ISC DHCP IPv4 server
     Loaded: loaded (/lib/systemd/system/isc-dhcp-server.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2023-01-16 02:12:55 UTC; 22s ago
       Docs: man:dhcpd(8)
   Main PID: 1425 (dhcpd)
      Tasks: 4 (limit: 2237)
     Memory: 4.5M
        CPU: 9ms
     CGroup: /system.slice/isc-dhcp-server.service
             └─1425 dhcpd -user dhcpd -group dhcpd -f -4 -pf /run/dhcp-server/dhcpd.pid -cf /etc/dhcp/dhcpd.conf enp0s8

Jan 16 02:12:55 k8s sh[1425]: PID file: /run/dhcp-server/dhcpd.pid
Jan 16 02:12:55 k8s dhcpd[1425]: Wrote 0 leases to leases file.
Jan 16 02:12:55 k8s sh[1425]: Wrote 0 leases to leases file.
Jan 16 02:12:55 k8s dhcpd[1425]: Listening on LPF/enp0s8/08:00:27:8e:b9:6c/192.168.56.0/24
Jan 16 02:12:55 k8s sh[1425]: Listening on LPF/enp0s8/08:00:27:8e:b9:6c/192.168.56.0/24
Jan 16 02:12:55 k8s dhcpd[1425]: Sending on   LPF/enp0s8/08:00:27:8e:b9:6c/192.168.56.0/24
Jan 16 02:12:55 k8s sh[1425]: Sending on   LPF/enp0s8/08:00:27:8e:b9:6c/192.168.56.0/24
Jan 16 02:12:55 k8s dhcpd[1425]: Sending on   Socket/fallback/fallback-net
Jan 16 02:12:55 k8s sh[1425]: Sending on   Socket/fallback/fallback-net
Jan 16 02:12:55 k8s dhcpd[1425]: Server starting service.
root@k8s:~#

root@k8s:~# cat /etc/dhcp/dhcpd.conf
# dhcpd.conf
#
# Sample configuration file for ISC dhcpd
#
# Attention: If /etc/ltsp/dhcpd.conf exists, that will be used as
# configuration file instead of this file.
#

# option definitions common to all supported networks...
#option domain-name "example.com";
#option domain-name-servers ns1.example.com, ns2.example.com;

default-lease-time 600;
max-lease-time 7200;

# The ddns-updates-style parameter controls whether or not the server will
# attempt to do a DNS update when a lease is confirmed. We default to the
# behavior of the version 2 packages ('none', since DHCP v2 didn't
# have support for DDNS.)
ddns-update-style none;

# If this DHCP server is the official DHCP server for the local
# network, the authoritative directive should be uncommented.
<b>authoritative;</b>

# Use this to send dhcp log messages to a different log file (you also
# have to hack syslog.conf to complete the redirection).
#log-facility local7;

# No service will be given on this subnet, but declaring it helps the
# DHCP server to understand the network topology.

#subnet 10.152.187.0 netmask 255.255.255.0 {
#}

# This is a very basic subnet declaration.
#
<b>
subnet 192.168.56.0 netmask 255.255.255.0 {
  range 192.168.56.20 192.168.56.120;
  option routers 192.168.56.4;
}
</b>
<h1> connect to dhp client server</h1>

[root@rhel9 ~]# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:9a:c0:0c brd ff:ff:ff:ff:ff:ff
    inet 192.168.56.20/24 brd 192.168.56.255 scope global dynamic noprefixroute enp0s3
       valid_lft 542sec preferred_lft 542sec
    inet6 fd00:a84e:3f64:bab2:a00:27ff:fe9a:c00c/64 scope global dynamic noprefixroute
       valid_lft 535429sec preferred_lft 401572sec
    inet6 fe80::a00:27ff:fe9a:c00c/64 scope link noprefixroute
       valid_lft forever preferred_lft forever


mahsan@k8s:~$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:3a:ec:0a brd ff:ff:ff:ff:ff:ff
    inet 192.168.56.21/24 metric 100 brd 192.168.56.255 scope global dynamic enp0s3
       valid_lft 442sec preferred_lft 442sec
    inet6 fd00:a84e:3f64:bab2:a00:27ff:fe3a:ec0a/64 scope global dynamic mngtmpaddr noprefixroute
       valid_lft 535426sec preferred_lft 401569sec
    inet6 fe80::a00:27ff:fe3a:ec0a/64 scope link
       valid_lft forever preferred_lft forever
mahsan@k8s:~$ cat /etc/netplan/00-installer-config.yaml
network:
  ethernets:
    enp0s3:
      dhcp4: true
      dhcp6: false
  version: 2
mahsan@k8s:~$


<b>root@k8s:~# cat /var/lib/dhcp/dhcpd.leases</b>
# The format of this file is documented in the dhcpd.leases(5) manual page.
# This lease file was written by isc-dhcp-4.4.1

# authoring-byte-order entry is generated, DO NOT DELETE
authoring-byte-order little-endian;

server-duid "\000\001\000\001+Wo'\010\000'\216\271l";

lease 192.168.56.20 {
  starts 1 2023/01/16 02:44:51;
  ends 1 2023/01/16 02:54:51;
  cltt 1 2023/01/16 02:44:51;
  binding state active;
  next binding state free;
  rewind binding state free;
  hardware ethernet 08:00:27:9a:c0:0c;
  uid "\001\010\000'\232\300\014";
  client-hostname "rhel9";
}
lease 192.168.56.20 {
  starts 1 2023/01/16 02:49:50;
  ends 1 2023/01/16 02:59:50;
  cltt 1 2023/01/16 02:49:50;
  binding state active;
  next binding state free;
  rewind binding state free;
  hardware ethernet 08:00:27:9a:c0:0c;
  uid "\001\010\000'\232\300\014";
  client-hostname "rhel9";
}
lease 192.168.56.20 {
  starts 1 2023/01/16 02:54:50;
  ends 1 2023/01/16 03:04:50;
  cltt 1 2023/01/16 02:54:50;
  binding state active;
  next binding state free;
  rewind binding state free;
  hardware ethernet 08:00:27:9a:c0:0c;
  uid "\001\010\000'\232\300\014";
  client-hostname "rhel9";
}
lease 192.168.56.20 {
  starts 1 2023/01/16 02:59:50;
  ends 1 2023/01/16 03:09:50;
  cltt 1 2023/01/16 02:59:50;
  binding state active;
  next binding state free;
  rewind binding state free;
  hardware ethernet 08:00:27:9a:c0:0c;
  uid "\001\010\000'\232\300\014";
  client-hostname "rhel9";
}
lease 192.168.56.21 {
  starts 1 2023/01/16 03:05:48;
  ends 1 2023/01/16 03:15:48;
  cltt 1 2023/01/16 03:05:48;
  binding state active;
  next binding state free;
  rewind binding state free;
  hardware ethernet 08:00:27:3a:ec:0a;
  uid "\377\3424?>\000\002\000\000\253\021,W\242t\202\300\211\276";
  client-hostname "k8s";
}
lease 192.168.56.20 {
  starts 1 2023/01/16 03:06:04;
  ends 1 2023/01/16 03:16:04;
  cltt 1 2023/01/16 03:06:04;
  binding state active;
  next binding state free;
  rewind binding state free;
  hardware ethernet 08:00:27:9a:c0:0c;
  uid "\001\010\000'\232\300\014";
  client-hostname "rhel9";
}
root@k8s:~#
root@k8s:~# ll /var/lib/dhcp
total 24
drwxrwxr-x  2 root  dhcpd 4096 Jan 16 02:12 ./
drwxr-xr-x 39 root  root  4096 Aug 20 18:55 ../
-rw-r--r--  1 dhcpd dhcpd  219 Jan 16 02:01 dhcpd6.leases
-rw-rw-r--  1 root  dhcpd  219 Jan 16 01:56 dhcpd6.leases~
-rw-r--r--  1 dhcpd dhcpd 2415 Jan 16 03:10 dhcpd.leases
-rw-rw-r--  1 root  dhcpd  219 Jan 16 02:01 dhcpd.leases~
root@k8s:~#








