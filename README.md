# Asus-Zenbook-Duo-Secondary-Screen

This is just a small little project to get the Asus Zenbook Duo control brightness.

Location of script for Systemctl:
/etc/systemd/system/asus_screen.service


[Unit]
Description=Asus Brightness Changes

[Service]
Environment="DISPLAY=:0"
Environment="XAUTHORITY=/home/gaetano/.Xauthority"
ExecStartPre=/sbin/modprobe acpi_call
ExecStart=sudo /etc/asus_screen_brightness_controller


[Install]
WantedBy=multi-user.target
