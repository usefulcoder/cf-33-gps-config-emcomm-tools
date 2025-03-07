Step 1: Create and run the gpsd_auto.sh using sudo in your home directory
    Like so: sudo ./gpsd_auto start

    Ensure that the proper /dev/ttyUSB port is being passed. Typically for the AT command port on the onboard gps module on the CF-33, it is /dev/ttyUSB0. If it isn't /dev/ttyUSB0, or if you computer had a different device plugged into a usb port on boot, it will always be the first mount of the three that is created. please use sudo dmesg | grep ttyUSB and choose whichever /dev/ttyUSB* that is the first of the modem mounts



Step 2: Edit /etc/default/etc
    Edit the DEVICES="" to be DEVICES="/dev/ttyUSB1" (or whichever is the second modem mount as listed by sudo dmesg | grep ttyUSB)

Step 3: Stop and disable the gpsd service and the modemmanager service:
    sudo systemctl stop gpsd && sudo systemctl stop ModemManager && sudo systemctl disable gpsd && sudo systemctl disable ModemManager

Step 4: Edit /opt/emcomm-tools/bin/et-time to reference your GPS USB mount, not et-gps
    On line 6 in the first if statement, change /dev/et-gps to /dev/ttyUSB1 or whichever your gps mount is

Step 5: Edit /opt/emcomm-tools/bin/et-system-info to reference your GPS USB mount, not et-gps
    On line 133 within the conditional, change /dev/et-gps to /dev/ttyUSB1 or whichever your gps mount is
    on line 136, add a # to the beginning of systemctl status gpsd --no-pager > /dev/null 

Step 6: create and run the gps_start.sh script. It uses /dev/ttyUSB1 as the default GPS USB mount, please change to accomodate your setup
    sudo ./gps_start.sh


you should now be seeing a "no fix" or "connected" in the desktop information GUI where GPS is under Interfaces.