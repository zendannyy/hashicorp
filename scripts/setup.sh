#!/usr/bin/env bash

FRONTEND=noninteractive sudo apt update -y
update -y
install cmake build-essential y; install checkinstall git -y; install hashcat -y

# Nvidia Drivers
echo "blacklist noeveau" | tee -a /etc/modprobe.d/blacklist-nouveau.conf