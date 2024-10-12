

#
#	python3 health.proc.py run --path="Selenium_Check_1.Se.py"
#
#



#/
#
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness._plays import retrieve_plays
#
#
import time
#
#\



def check_1 ():
	driver = connect_to_driver ();
	plays = retrieve_plays ();
	
	URL = plays ["URL"]
	
	driver.get (URL)
	
	
checks = {
	'Selenium Check 1': check_1
}