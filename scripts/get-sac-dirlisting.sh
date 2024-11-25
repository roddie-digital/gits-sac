#!/bin/bash
# 2024-11-24 https://roddie.digital
# Generate CSV lines for screenshots

# Variables
workdir='/mnt/file/data2/pictures/sac'
slug='sac2045-s01e12'
dirlist="$workdir/$slug.txt"
rooturl="https://raw.githubusercontent.com/roddie-digital/gits-sac/main/images/$slug"

# Check if the directory list file exists and remove it if it does
if [ -e "$dirlist" ]; then
    rm "$dirlist"
else
    echo "$dirlist does not exist"
fi

# Create an array of sorted picture files
pictures=($(ls "$workdir/$slug"/*.jpg 2>/dev/null | sort))

# Write to the directory list file
for pic in "${pictures[@]}"; do
    pic_name=$(basename "$pic")  # Get the file name without the path
    newline="$rooturl/$pic_name,SAC_2045 s01e12 NOSTALGIA - All Will Become N. #SAC2045,FALSE"
    echo "$newline" >> "$dirlist"
done
