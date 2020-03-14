#!/system/bin/sh
# Universal GMS Doze
# Copyright © 2020 GL-DP, gloeyisk
# License: GPLv2
#

# Sleep before the script executed (in seconds);
sleep 80

# Disable collective Device administrators;
pm disable com.google.android.gms/com.google.android.gms.mdm.receivers.MdmDeviceAdminReceiver

# Doze setup services;
su -c "pm enable com.google.android.gms/.ads.AdRequestBrokerService"
su -c "pm enable com.google.android.gms/.ads.identifier.service.AdvertisingIdService"
su -c "pm enable com.google.android.gms/.ads.social.GcmSchedulerWakeupService"
su -c "pm enable com.google.android.gms/.analytics.AnalyticsService"
su -c "pm enable com.google.android.gms/.analytics.service.PlayLogMonitorIntervalService"
su -c "pm enable com.google.android.gms/.backup.BackupTransportService"
su -c "pm enable com.google.android.gms/.update.SystemUpdateActivity"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService\$ActiveReceiver"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService\$Receiver"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService\$SecretCodeReceiver"
su -c "pm enable com.google.android.gms/.thunderbird.settings.ThunderbirdSettingInjectorService"
su -c "pm enable com.google.android.gsf/.update.SystemUpdateActivity"
su -c "pm enable com.google.android.gsf/.update.SystemUpdatePanoActivity"
su -c "pm enable com.google.android.gsf/.update.SystemUpdateService"
su -c "pm enable com.google.android.gsf/.update.SystemUpdateService\$Receiver"
su -c "pm enable com.google.android.gsf/.update.SystemUpdateService\$SecretCodeReceiver"

# Done
exit 0
