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
cp ~/Pictures/$package/* ~/Pictures/wallpapers/
rm -r ~/Pictures/$package

cp ~/.bashrc ~/.bashrc.backup
echo "${PWD}/rwallpaper 15" >> ~/.bashrc
echo "# Do you use Gnome? (Y/N)"
read answer
if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
   echo "gsettings set org.gnome.desktop.background picture-uri-dark file:///home/$USER/Pictures/twall/today.jpg" >> ~/.bashrc
   echo "gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/Pictures/twall/today.jpg" >> ~/.bashrc
fi
echo "# All Done, Have a nice day!"
