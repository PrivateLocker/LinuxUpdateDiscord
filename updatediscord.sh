#!/bin/bash
name="Discord"
tempname="discord.deb"
updateurl="https://discordapp.com/api/download?platform=linux&format=deb"
clear;
echo -e "Killing all Processes with name $name.";
# Killing all Processes using Discord name.
for KILLPID in `ps ax | grep $name | awk ' { print $1;}'`; do 
  kill -9 $KILLPID &> /dev/null
done
echo -e "";
echo -e "Pulling $tempname from $updateurl";
# Pulling current version from Discord.com
wget "$updateurl" -O $pwd/$tempname >/dev/null 2>&1
echo -e "";
echo -e "Installing $tempname";
# Installing current version of Discord
dpkg -i $pwd/$tempname >/dev/null
echo -e "";
echo -e "Removing temp $tempname";
# Removing temp .deb file
rm -rf $tempname >/dev/null
echo -e "";
echo -e "Finished"
echo -e "";
echo -e "You can now launch Discord by typing: discord";
echo -e "";

