#!/bin/bash

# download ec2-api-tools.zip and extract it where you want
# wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
export EC2_HOME=/srv/ec2-api-tools-1.7.1.0
#source root_key.csv
echo $EC2_HOME

# create original vagrant box and extract its content using tar
tar xfpv kali-linux-1.0.6-amd64-mini.box


# create s3 bucket to receive machine disks

# make sure vmdk has 
#  - key provisioning enabled
#  - key only access enabled
# prior to upload (TODO)
$EC_HOME/bin/ec2-import-volume /srv/dev/packer-kali/kali-linux-1.0.6-amd64-mini-disk1.vmdk -f vmdk -z us-east-1d -b ami_random_bsidesquebec -o $AWS_ACCESS_KEY -w $AWS_SECRET_KEY

$EC_HOME/bin/ec2-describe-conversion-tasks

# create snapshot of volume

# create ami from snapshot (hvm!)

# login to aws AMI (it works!)

# delete content of s3-bucket
