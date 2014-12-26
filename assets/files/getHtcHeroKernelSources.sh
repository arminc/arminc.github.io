#!/bin/bash
#Armin Coralic http://blog.coralic.nl

echo "Get the sources....."
sleep 5
cd ~/myandroid
wget http://member.america.htc.com/download/RomCode/Source_and_Binaries/kernel_hero_0078c992.tar.bz2

echo "Unpack te tar....."
tar xvjf kernel_hero_0078c992.tar.bz2
rm -rf kernel_hero_0078c992.tar.bz2
