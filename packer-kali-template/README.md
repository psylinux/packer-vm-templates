packer-kali64
=============

**Usage** 

    # full
    packer build -only=virtualbox-iso kali64-full.json
    vagrant box add kali64-1.0.6-full kali64-1.0.6-full.box

    # mini 
    packer build -only=virtualbox-iso kali64-mini.json
    vagrant box add kali64-1.0.6-mini kali64-1.0.6-mini.box
