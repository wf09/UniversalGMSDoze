gmsdir=$MODPATH/gms
sysgms=$MODPATH/system/etc/sysconfig
progms=$MODPATH/system/product/etc/sysconfig
vengms=$MODPATH/vendor/etc/sysconfig
watgms=$MODPATH/system/etc/sysconfig
modprop=$MODPATH/module.prop

m() { cp $gmsdir/6/google.xml $sysgms; }
n() { cp $gmsdir/7/google.xml $sysgms; }
o() { cp $gmsdir/8/google.xml $sysgms; }
p() { cp $gmsdir/9/google.xml $sysgms; }
q() { cp $gmsdir/10/google.xml $sysgms; }
w() { cp $gmsdir/w/clockwork.xml $sysgms; }
opt() { cp $gmsdir/opt.sh /data/adb/service.d; }

cleanup() {
	rm -rf $gmsdir
}

# Android version selection;
PART=1
ui_print " "
ui_print "- Which Android version do you running on?"
ui_print "  Vol+ = Next; Vol- = Select"
ui_print " "
ui_print "  1. Q (10)"
ui_print "  2. Pie (9)"
ui_print "  3. Oreo (8.0/8.1)"
ui_print "  4. Nougat (7.0/7.1)"
ui_print "  5. Marshmallow (6.0)"
ui_print " "
ui_print "  Select:"
while true; do
	ui_print "  $PART"
	if $VKSEL; then
		PART=$((PART + 1))
	else 
		break
	fi
	if [ $PART -gt 5 ]; then
		PART=1
	fi
done
ui_print "  Selected: $PART"

w=false
if [ $PART -ne 0 ]; then
ui_print "   "
ui_print "- Do you use this module on Smartwatch?"
ui_print "  Vol+ = Yes; Vol- = No"
ui_print "   "
	if $VKSEL; then
	w=true	
	ui_print "  Selected: Yes"
	else
	ui_print "  Selected: No"	
	fi
fi

OPT=false
if [ $PART -ne 0 ]; then
ui_print "   "
ui_print "- Install additional opt.sh?"
ui_print "  Vol+ = Yes; Vol- = No"
ui_print "   "
	if $VKSEL; then
	OPT=true	
	ui_print "  Selected: Yes"
	else
	ui_print "  Selected: No"	
	fi
fi

# Installation;
ui_print " "
ui_print "- Installing"

mkdir -p $sysgms $progms $vengms

case $PART in
	1 ) q; sed -ie 3's/$/-Q&/' $modprop;;
	2 ) p; sed -ie 3's/$/-Pie&/' $modprop;;
	3 ) o; sed -ie 3's/$/-Oreo&/' $modprop;;
	4 ) n; sed -ie 3's/$/-Nougat&/' $modprop;;
	5 ) m; sed -ie 3's/$/-Marshmallow&/' $modprop;;
esac

if $w; then
	w
fi

if $OPT; then
	opt
fi

cleanup
