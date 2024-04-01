#!/bin/bash
package="generic" # Define Wallpaper Package
if [ $# -gt 0 ]; then
 package=$1 # Or set a Wallpaper Package provided by the user
fi
clear
echo "# Installing Random-Wallpaper Script, using wallpaper package '$package'..."
mkdir ~/Pictures/wallpapers/
mkdir ~/Pictures/twall/
cp -r wallpapers/$package ~/Pictures/
mv ~/Pictures/$package ~/Pictures/wallpapers/
cp ~/.bashrc ~/.bashrc.backup
echo "${PWD}/rwallpaper 15" >> ~/.bashrc
echo "# All Done, Have a nice day!
echo ""
