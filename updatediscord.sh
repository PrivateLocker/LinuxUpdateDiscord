#!/bin/bash

if command -v dpkg &> /dev/null
then
    PKG_TYPE="deb"
else
    PKG_TYPE="tar.gz"
fi

PACKAGE="discord.$PKG_TYPE"
UPDATE_URL="https://discordapp.com/api/download?platform=linux&format=$PKG_TYPE"
RENAME=false


if [ $PKG_TYPE == "deb" ]
then
    DPATH = "$HOME/Downloads"
elif [ -d "/usr/lib64/discord" ]
    DPATH = "/usr/lib64"
    RENAME=true
elif [ -d "usr/lib64/Discord" ]
    DPATH = "/usr/lib64"
else
    DPATH = "/usr/local/lib64"
fi

# Ensure our path exists
mkdir -p $DPATH

echo "Killing Discord processes!"
for KILLPID in `ps ax | grep Discord | awk ' { print $1;}'`; do 
  kill -9 $KILLPID &> /dev/null
done

echo "Downloading Discord updates"
wget $UPDATE_URL -O $DPATH/$PACKAGE

echo "Installing Discord updates"
cd $DPATH

if [ $PKG_TYPE == "deb" ]
then
    dpkg -i $DPATH/$PACKAGE
else
    tar xvf $PACKAGE
fi

if RENAME
then
    rm -rf discord
    mv Discord discord
fi

rm $PACKAGE

echo "Discord updated!"
