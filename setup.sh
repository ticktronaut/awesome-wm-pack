#/bin/bash

if [ -d "$HOME/.config/awesome" ]
then

echo
read -p "Directory $HOME/.config/awesome exists already. If you proceed your current configuration of awesome window manager will be overwritten. Do you want to proceed? (Enter y/N):" choice
echo
case "$choice" in
  y|Y ) echo "Yes! Enjoy these new awesome WM features.";;
  n|N ) echo "No? Fair enough. Aborting." && exit 1;;
  * ) echo "Invalid response. Aborting." && exit 1;;
esac
echo

# uncommit this, if you want a backup of your prior awesome configuration
echo "backup"
mkdir $HOME/.config/awesome_backup
mv $HOME/.config/awesome $HOME/.config/awesome_backup/awesome_$(date +"_%Y-%m-%d_%H%M%S")
echo ""
fi

./download_wallpapers.sh

#yes | cp -i -r ./awesome_default $HOME/.config/awesome # do default configuration
yes | cp -i -r ./awesome_custom $HOME/.config/awesome # do custom configuration
yes | cp -i -r ./themes $HOME/.config/awesome
echo ""

# for battery widget
yes | sudo apt install acpi
# for screenshot script
yes | sudo apt install deepin-screenshot
# for conky
#sudo apt install conky

# for screen lock
yes | apt install i3lock

# test configuration
Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome

# todo: cp conky configuration to $HOME/.config/.conkyrc
