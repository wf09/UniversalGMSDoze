#!/system/bin/sh
# Universal GMS Doze
# Copyright © 2020 GL-DP, gloeyisk
# License: GPLv2
#

# Sleep before the scripts executed (in seconds);
sleep 80

# Disable collective Device administrators;
pm disable com.google.android.gms/com.google.android.gms.mdm.receivers.MdmDeviceAdminReceiver

# Done
