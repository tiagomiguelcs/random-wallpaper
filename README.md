# The Random Wallpaper Bash Script (rwallpaper)
Set the <ins><b>same</b></ins> random wallpaper on multiple monitors without any "fancy" app. 

The script was successfully tested under [Linux Mint 21.1 Xfce Edition](https://linuxmint.com/rel_vera_xfce_whatsnew.php), [Pop!_OS](https://pop.system76.com/), and [Debian 12](https://www.debian.org/index.pt.html) with the Cinnamon and Gnome desktop environments. However, it should also work on other Linux distributions and desktop environments with minimal or no modification.

# How to Install
1. Clone this repository and change to its directory:
```
$ git clone https://github.com/tiagomiguelcs/random-wallpaper.git
$ cd random-wallpaper
```
(Optional) In the script, set the ``path`` variable to the wallpapers' directory:
```
path=~/Pictures/wallpapers/ 
```
2. Run the install script and the main script:
```
./install.sh && ./rwallpaper
```
3. In your desktop settings, set the wallpaper to the one defined in the script (i.e., ``~/Pictures/twall/today.jpg``)

<img src="screenshots/desktop-settings.png" width="400px" height="385px" alt="desktop-settings"/>

(**Or**) If you are using the Gnome desktop, please set the wallpaper as follows:
```
gsettings set org.gnome.desktop.background picture-uri-dark file:///home/[username]/Pictures/twall/today.jpg
gsettings set org.gnome.desktop.background picture-uri file:///home/[username]/Pictures/twall/today.jpg
```
(**Alternative**) Use `feh` to set the wallpaper: 
```
feh --bg-scale ~/Pictures/twall/today.jpg
```
4. Enjoy! 😄
