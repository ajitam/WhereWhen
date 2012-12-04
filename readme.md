#WhereWhen

This simple script runs every 5 minutes and gets MAC address of gateway you connected to.
Based on that you can see where you have been.

> Tested on OS X 10.6.

##Installation

1. Copy watchdog to location you want (for this example - "/home/scripts/")
2. Create txt file (for this example - "/var/log/ww_log.txt")
3. In watchdog.sh set path to txt file from step (2).
	echo $input >> /var/log/ww_log.txt

4. Set cron job (command: "crontab -e")
	*/5 * * * * /home/scripts/watchdog.sh &> /dev/null
	
(This tells cron to run script every 5 minutes and dismiss any output)
	
5. Sit back and relax. Data should start to appear in file.

#"Raw data

Data stored in ww_log.txt looks like this:
	...
	201104281545#0:2:a5:8c:f9:e2
	201104281550#0:2:a5:8c:f9:e2
	201104281555#0:2:a5:8c:f9:e2
	...