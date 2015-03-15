#!/bin/bash
#Created by Armin Coralic http://blog.coralic.nl
if [ "$1" == "" ] ; 
then
	echo "You need to specify the img file!"
	exit 9;
fi

if `test -d /data/local/mnt` ; then
   echo "/data/local/mnt"
else
   mkdir /data/local/mnt
fi

export HOME=/root
export USER=root
export PATH=$bin:/usr/bin:/usr/sbin:/bin:$PATH

mount -o loop,noatime -t ext2 $1 /data/local/mnt
sleep 3
mount -t proc proc /data/local/mnt/proc
mount -t devpts devpts /data/local/mnt/dev/pts
chroot /data/local/mnt /bin/bash
