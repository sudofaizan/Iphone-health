if idevicediagnostics -h     >/dev/null
then
echo "Toolkit present"
else
echo "Installing tools required"
if sudo apt-get install build-essential checkinstall git autoconf automake libtool-bin libplist-dev libimobiledevice-glue-dev libusbmuxd-dev libssl-dev usbmuxd
then
echo "installed"
else
echo "error installing tools:- build-essential checkinstall git autoconf automake libtool-bin libplist-dev libimobiledevice-glue-dev libusbmuxd-dev libssl-dev usbmuxd"
exit
fi
fi
if idevicediagnostics diagnostics GasGauge >file.plist
then
CC=$(xmllint --xpath 'string(//dict/key["CycleCount"]/following-sibling::integer/text())' file.plist)
DC=$(xmllint --xpath 'string(//dict[key="GasGauge"]/dict/key["DesignCapacity"][2]/following-sibling::integer[1])' file.plist)
percentage=$(echo "scale=2; ($CC/$DC) * 100" | bc)
remain=$(echo "scale=2; "100.00"-$percentage  "| bc )
name=$( ideviceinfo|grep "DeviceName:" )
SN=$(ideviceinfo|grep -w "SerialNumber:")
CCRG=$(ideviceinfo  -q com.apple.mobile.battery |grep BatteryCurrentCapacity)
echo "$name
$SN
$CCRG
Total cycle count       :$CC
Max design cycle        :$DC
Actual used %           :$percentage %
Actual battey health %  :$remain %"
rm file.plist
else
rm file.plist
echo "No device connected"
fi