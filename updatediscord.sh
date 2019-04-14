#!/bin/bash
name="Discord"
tempname="discord.deb"
updateurl="https://discordapp.com/api/download?platform=linux&format=deb"

# Killing all Processes using Discord name.
for KILLPID in `ps ax | grep $name | awk ' { print $1;}'`; do 
  kill -9 $KILLPID;
done

# Pulling current version from Discord.com
wget "$updateurl" -O $pwd/$tempname

# Installing current version of Discord
dpkg -i $pwd/$tempname

# Removing temp .deb file
rm -rf $tempname
