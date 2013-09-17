#
# Regular cron jobs for the librets package
#
0 4	* * *	root	[ -x /usr/bin/librets_maintenance ] && /usr/bin/librets_maintenance
