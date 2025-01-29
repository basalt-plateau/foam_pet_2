



#
#
#	python3 health.proc.py run --path="Regions/Scholars/Theme/change_net.Se.py"
#
#

#/
#
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness._plays import retrieve_plays
#
from vivaciousness.procedures.loop import loop
from vivaciousness.regions.Seeds.Features.change_net import change_net
#
from vivaciousness.memo import proceed_through_memo
#
#
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
#
#
import time
#
#\

def check_1 ():
	driver_1 = connect_to_driver ();
	plays = retrieve_plays ();
	URL = plays ["URL"]
	
	driver_1.get (URL)
	proceed_through_memo ({ "driver": driver_1 });
	
	change_net ({
		"driver": driver_1,
		"net_name": "mainnet",
		"net_path": "https://api.mainnet.aptoslabs.com/v1"
	})
	
	change_net ({
		"driver": driver_1,
		"net_name": "devnet",
		"net_path": "https://api.devnet.aptoslabs.com/v1"
	})
	
	#time.sleep (10)
	
checks = {
	'roomies, plays, change net': check_1
}