#!/bin/bash
# Check if the threshold in minutes is provided as a command-line argument
if [ $# -ne 1 ]; then
    # echo "Usage: $0 <threshold_minutes>"
    threshold_minutes=-1
		# exit 1
else
		threshold_minutes=$1
fi

# Set the directory where all the fancy wallpapers are located
path=~/Pictures/wallpapers/ 
# Define the directory where the chosen random wallpaper will be stored
tpath=~/Pictures/twall/ 
# Set the filename of the random wallpaper
today=$tpath
today+=today.jpg
cd $path
# Pick a random wallpaper
wallpaper=$path
wallpaper+=$(ls | shuf -n 1)
#echo $tpath $wallpaper $today

# Get the modification time of the file in seconds
file_mtime=$(stat -c "%Y" "$today")
# Get the current time in seconds
current_time=$(date +%s)
threshold=$((threshold_minutes * 60))
# Calculate the time difference
time_diff=$((current_time - file_mtime))

if [ "$threshold_minutes" -eq -1 ]; then
# Check if the wallpaper is older than threshold seconds
	mkdir -p $tpath && cp $wallpaper $today
else
	if [ "$time_diff" -gt "$threshold" ]; then
		# The wallpaper was set $threshold seconds ago, changing to another
    # echo "File is older than "$threshold" seconds. Changing wallpaper..."
	  mkdir -p $tpath && cp $wallpaper $today
	fi
fi
