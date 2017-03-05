#!/bin/bash

# $1 = username

if [ "$1" == "" ]; then
	echo "No username provided"
	exit 1
fi

cp -R profile/.artworks /home/$1/
cp -R profile/.config /home/$1/
cp -R profile/.fonts /home/$1/
cp -R profile/.kde4 /home/$1/
cp -R profile/.local /home/$1/
cp profile/.gtk* /home/$1/
chown -R $1:users /home/$1
find /home/$1 -type d -exec chmod 700 {} +
find /home/$1 -type f -exec chmod 600 {} +

sed -i "/username/c\ <bookmark href=\"file:\/\/\/home/$1\">" /home/$1/.local/share/user-places.xbel
