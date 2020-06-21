#!/bin/bash
packer build -only=virtualbox-iso kali-linux-1.0.7-amd64-mini.json
packer build -only=virtualbox-iso kali-linux-1.0.6-amd64.json
packer build -only=virtualbox-iso kali-linux-1.0.6-i386-mini.json
packer build -only=virtualbox-iso kali-linux-1.0.6-i386.json
