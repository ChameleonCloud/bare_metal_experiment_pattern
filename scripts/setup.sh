#!/usr/bin/env bash

echo "Setting up experimental environment"
echo
echo "**********************************************"
echo "** Note: this wouldn't be necessary if      **"
echo "** I was using a saved disk image snapshot! **"
echo "**********************************************"
echo

PACKAGES=(stress-ng)

sudo dnf makecache -y
sudo dnf install -y "${PACKAGES[@]}"

