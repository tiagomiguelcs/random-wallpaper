#!/bin/bash
mkdir ~/Pictures/wallpapers/
mkdir ~/Pictures/twall/
cp -r wallpapers ~/Pictures/
cp ~/.bashrc ~/.bashrc.backup
echo "${PWD}/rwallpaper 15" >> ~/.bashrc
