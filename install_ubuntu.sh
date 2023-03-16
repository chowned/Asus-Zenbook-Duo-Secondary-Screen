#!/bin/bash

sudo apt install llinux-headers-$(uname -r) dkms git
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
sudo apt install  gtk3 

gcc `pkg-config --cflags gtk+-3.0` -o asus_screen_brightness_controller gui_to_run_script.c `pkg-config --libs gtk+-3.0`

#gcc `pkg-config --cflags gtk+-3.0` -o asus_screen_brightness_controller gui_to_run_script.c `pkg-config --libs gtk+-3.0`

sudo mv ./asus_screen_brightness_controller /etc/asus_screen_brightness_controller


sudo crontab -l > ./crontab.txt
echo "@reboot sudo modprobe acpi_call" >> crontab.txt
echo "@reboot /etc/asus_screen_brightness_controller" >> crontab.txt
sudo crontab crontab.txt
sudo rm ./crontab.txt
