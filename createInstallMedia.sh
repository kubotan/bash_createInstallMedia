#!/bin/bash

###############################################################################################
#
#  Execute the command as follows on the Mac console to start creating the installation media.
#
#  $ sh createInstallMedia.sh 
#
###############################################################################################
clear


echo "===== External Disk List ====="
diskutil list external
countExternal=`diskutil list external | wc -l`
defaultDisk=`diskutil list external | head -1 | cut -d ' ' -f 1`
if [ $countExternal -le 0 ]; then
  echo "Can not find disk of external."
  echo "Please insert usb storage device."
fi
echo ""
echo ""

echo "===== Download ISO List ====="
find ~/Downloads -maxdepth 1 -type f -name *.iso
countDownload=`find ~/Downloads -maxdepth 1 -type f -name *.iso | wc -l`
defaultISO=`find ~/Downloads -maxdepth 1 -type f -name *.iso | head -1`
if [ $countDownload -le 0 ]; then
  echo "Can not find file of ISO."
  echo "Please download iso file. https://www.centos.org/download/ "
fi
echo ""
echo ""


if [ $countExternal -le 0 -o $countDownload -le 0 ]; then
  exit
fi


/bin/echo -n "Enter the USB storage to create the installation disk [$defaultDisk]: "
read disk
if [ -z "$disk" ]; then
  disk=$defaultDisk
fi


/bin/echo -n "Enter the ISO file to create the installation disk [$defaultISO]: "
read ISO
if [ -z "$ISO" ]; then
  ISO=$defaultISO
fi
echo ""
echo ""


echo "Execute this command."
echo ""
echo "  Command:"
echo "    /usr/sbin/diskutil unMountDisk $disk"
echo "    /usr/bin/sudo /bin/dd if=$ISO of=$disk"
echo ""
/bin/echo -n "Do you want to continue? [Y/n]"
read answer
if [ $answer = "Y" ]; then
  clear
  echo "Press Control + T to display the progress."
  echo "Executing..."
  /usr/sbin/diskutil unMountDisk $disk
  /usr/bin/sudo /bin/dd if=$ISO of=$disk
  echo "Finished."
else
  echo "It's cancelled."
fi
