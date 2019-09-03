#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode

# Sleep statements (delay execution);
sleep 15

# Disable GMS and IMS run in startup and restart it on boot (experimental);
cmd appops set com.google.android.gms BOOT_COMPLETED ignore
cmd appops set com.google.android.ims BOOT_COMPLETED ignore
cmd appops set com.google.android.ims WAKE_LOCK ignore

# Disable GMS and IMS run in startup and restart it on boot (custom permissions for Oxygen OS);
cmd appops set com.google.android.gms AUTO_START ignore
cmd appops set com.google.android.ims AUTO_START ignore
cmd appops set com.google.android.ims WAKE_LOCK ignore

# Executing...
# Done

exit 0
