#!/bin/bash
#Created by Armin Coralic http://blog.coralic.nl

#Set the nameservers for the chroot
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
echo "127.0.0.1 localhost" > /etc/hosts

#Create an script that is going to be used to set the vncserver password
echo "#!/bin/bash
export USER=root
expect << EOF
spawn vncpasswd
expect \"Password:\"
send \"testing\r\"
expect \"Verify:\"
send \"testing\r\"
expect \"Would you like to enter a view-only password (y/n)?\"
send \"n\r\"
expect eof;
EOF" > setVNCpass.sh

#Run the vncserver password script
chmod +x setVNCpass.sh
./setVNCpass.sh
vncserver
vncserver -kill :1

#Configure vncserver
echo "#!/bin/bash
xrdb $HOME/.Xresources
xsetroot -solid grey
icewm &
lxsession" > /root/.vnc/xstartup

#sed -i '1i vncserver -geometry 800x600' /root/.bashrc
#sed -i '1i /etc/init.d/ssh restart' /root/.bashrc
