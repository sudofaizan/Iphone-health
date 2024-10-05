# Iphone-health

### this tool will get you identify the Iphone battery weather its real or fake.

### Pre-Requisite
* linux os or macbook

### Steps
* open your terminal and clone this repo then go in repo folder.
* connect your iphone and press trust-popup on iphone and enter password
* run command ``bash getIPhonehealth.sh``

you will get something like this in output 

fquazi@MacBook-Pro Iphone-health % bash getIPhonehealth.sh
Toolkit present
DeviceName: Shaikh’s iPhone
SerialNumber: CN61WTKXFC
BatteryCurrentCapacity: 60
Total cycle count       :444
Max design cycle        :4297
Actual used %           :10.00 %
Actual battey health %  :90.00 %


### how to verify battery is orignal not boosted?

if ~Total cycle count~  is more then ~ Max design cycle~
its boosted dont buy that iphone

if ~Actual battey healtht~  is not more then or less then 7 points variation in settings/battery/health of iphone then its real battery health
example.

in setting>battery>health you see 100%
and with this tool you see 92 % > then its real.

if its showing less then 92 % then its fake or manipulated battery.

# Regards Faizan quazi

contact me via Email Faizii.official@gmail.com