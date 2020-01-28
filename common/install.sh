for i in $(find /system -type f -name "google.xml"); do
  [ "$(basename `dirname $i`)" == "sysconfig" ] && cp_ch $MODPATH/common/google.xml $MODPATH$i
done
install_script -l $MODPATH/common/opt.sh

