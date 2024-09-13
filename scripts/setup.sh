#!/usr/bin/env bash

echo "Setting up experimental environment"
echo

sudo apt update -y
sudo apt install -y stress-ng python3-swiftclient "linux-tools-$(uname -r)"
sudo modprobe intel_rapl_msr


