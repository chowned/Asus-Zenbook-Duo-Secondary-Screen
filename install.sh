#!/bin/bash

sudo pacman -S linux$(uname -r | sed 's/\([0-9]\)\.\([0-9]\).*/\1\2/')-headers dkms git
git clone https://github.com/nix-community/acpi_call
cd acpi_call
make
sudo make install


sudo cp ./acpi_call.ko /lib/modules/$(uname -r)/extra/
sudo depmod -a
cd ..
rm -rf ./acpi_call

sudo modprobe acpi_call



# required for gui
sudo pacman -S gtk3 

gcc `pkg-config --cflags gtk+-3.0` -o asus_screen_brightness_controller gui_to_run_script.c `pkg-config --libs gtk+-3.0

#gcc `pkg-config --cflags gtk+-3.0` -o asus_screen_brightness_controller gui_to_run_script.c `pkg-config --libs gtk+-3.0`

mv ./asus_screen_brightness_controller /etc/asus_screen_brightness_controller


sudo crontab -l > ./crontab.txt
echo "@reboot sudo modprobe acpi_call" >> crontab.txt
echo "@reboot /etc/asus_screen_brightness_controller" >> crontab.txt
sudo crontab crontab.txt
sudo rm ./crontab.txt
