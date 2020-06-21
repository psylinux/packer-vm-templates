#!/bin/bash

echo "debug: Executing scripts/common/cleanup.sh"

# remove any temp files.
sudo rm -rf /tmp/*
sudo yum clean all
rm -rf /var/cache/yum

# clean the log files
for logfile in $(sudo find /var/log -type f | grep "\.log"); do
  sudo rm -f $logfile \
  && sudo touch $logfile
done

if [ -f ~/.bash_history ]; then
  echo "" > ~/.bash_history
fi

swap_device_uuid=`sudo /sbin/blkid -t TYPE=swap -o value -s UUID | uniq`
swap_device_label=`sudo /sbin/blkid -t TYPE=swap -o value -s LABEL | uniq`
if [ -n "$swap_device_uuid" ]; then
  swap_device=`readlink -f /dev/disk/by-uuid/"$swap_device_uuid"`
elif [ -n "$swap_device_label" ]; then
  swap_device=`readlink -f /dev/disk/by-label/"$swap_device_label"`
fi

sudo /sbin/swapoff "$swap_device"
sudo dd if=/dev/zero of="$swap_device" bs=1M || :
sudo /sbin/mkswap ${swap_device_label:+-L "$swap_device_label"} ${swap_device_uuid:+-U "$swap_device_uuid"} "$swap_device"

sync