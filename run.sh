#!/bin/sh
echo "booting with helmfile"

jx boot -b --verbose --no-update-git
