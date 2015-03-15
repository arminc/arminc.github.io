#!/bin/bash
#Created by Armin Coralic http://blog.coralic.nl

if [ "$1" == "" ] ; 
then
	echo "You need to specify the img file!"
	exit 9;
fi

sudo mount -o loop $1 /mnt
sleep 5
sudo mount -t proc proc /mnt/proc
sudo mount -t devpts devpts /mnt/dev/pts
sudo su -c 'chroot /mnt /bin/bash'
