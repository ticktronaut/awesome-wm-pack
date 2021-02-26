#!/bin/bash

# warning, these these themes are downloaded from unknown origin
# without any information about the license
# download to own risK

wp_url=https://wallpapercave.com/download/alone-anime-wallpapers-wp3856540?nocache=1

echo "Downlaod wallpaper."

echo "Warning: This wallpaper is dowloaded from a community driven wallper site (wallpapercave.com). It is your responsibility to check integrity origin and license of the wallpaper fetched from url:"
echo "$wp_url"

read -p "Do you want to procees (Enter y/N): " choice
echo
case "$choice" in
  y|Y ) curl $wp_url -o themes/tick/wallpaper/wallpaper.jpg && convert themes/tick/wallpaper/wallpaper.jpg themes/tick/lockscreen/wallpaper.png;;
  n|N ) echo "abort!";;
  *)    echo "abort!";; 
esac
