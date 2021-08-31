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
sudo apt -y install acpi
# for screenshot script
sudo apt -y install deepin-screenshot
# for conky
#sudo apt install conky

# for screen lock
sudo apt -y install i3lock

# for tdrop
sudo apt install xdotool
sudo apt -y install kitty # prefered terminal for tdrop
sudo cp conf/kitty.conf $HOME/.config/kitty/kitty.conf -i
git clone https://github.com/noctuid/tdrop.git
cd tdrop
sudo make install
cd ..
sudo rm tdrop -r

# for transparency
sudo apt -y install compton compton-conf
#LINE="compton"
#FILE="/etc/profile"
#grep -qF "$LINE" "$FILE"  || echo "$LINE" | sudo tee --append "$FILE"
#LINE="fading = true"
#FILE="$HOME/.config/compton.conf"
#touch "$FILE"
#grep -qF "$LINE" "$FILE"  || echo "$LINE" | sudo tee --append "$FILE"

# alternative to compton: xcompmgr
#sudo apt -y install xcompmgr

# test configuration
Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome

# todo: cp conky configuration to $HOME/.config/.conkyrc

