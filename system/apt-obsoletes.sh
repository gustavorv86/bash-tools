#!/bin/bash

echo "Orphaned"
deborphan
echo

echo "Local"
apt-show-versions | grep 'No available version in archive'
echo

