echo -e "\$GPS_START" > /dev/ttyUSB1
sudo gpsd -bn /dev/ttyUSB1
