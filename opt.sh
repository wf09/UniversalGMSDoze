#!/system/bin/sh
# Universal GMS Doze
# Copyright © 2019 GL-DP, gloeyisk
# License: GPLv2

# Sleep statements (delay execution);
sleep 80

# Disable Find My Device (in order to have optimized GMS for Android 9 or later);
pm disable com.google.android.gms/com.google.android.gms.mdm.receivers.MdmDeviceAdminReceiver

# Unset BusyBox variable (krasCGQ);
unset BB;

# Detect BusyBox locations and automatically use the detected one (krasCGQ);
for i in /sbin /system/xbin /su/xbin; do
	if [ -f $i/busybox ]; then
		BB=$i/busybox;
		NOBB=0;
		break;
	fi;
done;

# Stop unnecessary GMS and restart it on boot (dorimanx)
if [ "$($BB pidof com.google.android.gms | wc -l)" -eq "1" ]; then
	$BB kill $($BB pidof com.google.android.gms);
fi;
if [ "$($BB pidof com.google.android.gms.unstable | wc -l)" -eq "1" ]; then
	$BB kill $($BB pidof com.google.android.gms.unstable);
fi;
if [ "$($BB pidof com.google.android.gms.persistent | wc -l)" -eq "1" ]; then
	$BB kill $($BB pidof com.google.android.gms.persistent);
fi;
if [ "$($BB pidof com.google.android.gms.wearable | wc -l)" -eq "1" ]; then
	$BB kill $($BB pidof com.google.android.gms.wearable);
fi;

# Doze setup services;
su -c "pm enable com.google.android.gms/.update.SystemUpdateActivity"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService\$ActiveReceiver"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService\$Receiver"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService\$SecretCodeReceiver"
su -c "pm enable com.google.android.gsf/.update.SystemUpdateActivity"
su -c "pm enable com.google.android.gsf/.update.SystemUpdatePanoActivity"
su -c "pm enable com.google.android.gsf/.update.SystemUpdateService"
su -c "pm enable com.google.android.gsf/.update.SystemUpdateService\$Receiver"
su -c "pm enable com.google.android.gsf/.update.SystemUpdateService\$SecretCodeReceiver"
su -c "pm enable com.google.android.gms/com.google.android.gms.analytics.AnalyticsReceiver"
su -c "pm enable com.google.android.gms/com.google.android.gms.analytics.AnalyticsService"
su -c "pm enable com.google.android.gms/com.google.android.gms.analytics.AnalyticsTaskService"
su -c "pm enable com.google.android.gms/com.google.android.gms.analytics.service.AnalyticsService"
su -c "pm enable com.google.android.gms/com.google.android.gms.chimera.PersistentIntentOperationService"
su -c "pm enable com.google.android.gms/com.google.android.gms.clearcut.debug.ClearcutDebugDumpService"
su -c "pm enable com.google.android.gms/com.google.android.gms.common.stats.GmsCoreStatsService"
su -c "pm enable com.google.android.gms/com.google.android.gms.mdm.receivers.MdmDeviceAdminReceiver"
su -c "pm enable com.google.android.gms/com.google.android.gms.measurement.AppMeasurementJobService"
su -c "pm enable com.google.android.gms/com.google.android.gms.measurement.AppMeasurementInstallReferrerReceiver"
su -c "pm enable com.google.android.gms/com.google.android.gms.measurement.PackageMeasurementReceiver"
su -c "pm enable com.google.android.gms/com.google.android.gms.measurement.PackageMeasurementService"
su -c "pm enable com.google.android.gms/com.google.android.gms.measurement.service.MeasurementBrokerService"
su -c "pm enable com.google.android.gms/com.google.android.location.internal.AnalyticsSamplerReceiver"

# Trim selected partitions on boot;
fstrim /data;
fstrim /cache;
fstrim /system;

# Executing...
# Done
