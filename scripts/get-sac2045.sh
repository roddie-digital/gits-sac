#!/bin/bash
# 2024-11-24 https://roddie.digital
# Extract screenshots from Ghost in the Shell etc

# Variables
minutes=($(seq 0 24))
workdir='/mnt/file/data2/video/bd/gits-sac2045-s1'
episode='sac2045-s01e12.mkv'
slug='sac2045-s01e12'
jpgqual=2

hour='00'
second1='00'
second2='30'
second3='15'
second4='45'

# Set crop parameters based on input
input='sac2045'
case $input in
    'gits1995')
        cwidth='1856'
        cheight='1003'
        xoffset='31'
        yoffset='38'
        ;;
    'innocence')
        cwidth='1920'
        cheight='1036'
        xoffset='0'
        yoffset='22'
        ;;
    *)
        cwidth='1920'
        cheight='1080'
        xoffset='0'
        yoffset='0'
        ;;
esac

# Function to generate timestamps and run ffmpeg
generate_images() {
    local second1=$1
    local second2=$2

    for i in "${minutes[@]}"; do
        i=$(printf "%02d" $i)  # Format minute with leading zero

        timestamp1="${hour}:${i}:${second1}"
        timestamp2="${hour}:${i}:${second2}"

        crop="crop=${cwidth}:${cheight}:${xoffset}:${yoffset}"

        filename1="${slug}-${hour}-${i}-${second1}.jpg"
        filename2="${slug}-${hour}-${i}-${second2}.jpg"

        ffmpeg -ss "$timestamp1" -i "$workdir/$episode" -filter:v "$crop" -frames:v 1 -q:v $jpgqual "$workdir/$filename1" -v error
        ffmpeg -ss "$timestamp2" -i "$workdir/$episode" -filter:v "$crop" -frames:v 1 -q:v $jpgqual "$workdir/$filename2" -v error
    done
}

# Generate images for the first set of seconds
generate_images $second1 $second2

# Generate images for the second set of seconds
generate_images $second3 $second4
