sudo pacman -S linux$(uname -r | sed 's/\([0-9]\)\.\([0-9]\).*/\1\2/')-headers dkms git
git clone https://github.com/nix-community/acpi_call
cd acpi_call
make
sudo make install


sudo cp ./acpi_call.ko /lib/modules/$(uname -r)/extra/
sudo depmod -a
rm -rf ../acpi_call

sudo modprobe acpi_call
