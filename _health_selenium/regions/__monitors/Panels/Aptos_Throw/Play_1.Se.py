







#
#	python3 health.proc.py run --path="Panels/Aptos_Throw/Play_1.Se.py"
#

''''
	* open the ICAN Domain Address
	
	* change the inputs:
		* devnet
"'''

from selenium.webdriver.common.by import By

from vivaciousness._plays import retrieve_plays
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness.Milieus.navigate import Milieus_Navigate
from vivaciousness.memo import proceed_through_memo
from vivaciousness.procedures.loop import loop

import time

def check_1 ():
	plays = retrieve_plays ();
	
	##
	#
	accounts = plays ["accounts"]
	#
	origin_address = accounts ["1"] ["address"]
	origin_private_key = accounts ["1"] ["private key"]
	#
	address_to = accounts ["2"] ["address"]
	#
	##
	
	URL = plays ["URL"]
	driver_1 = connect_to_driver ();
	driver_1.get (URL)
	
	#
	#	* Install Wallet (Petra)
	#	* Find out what happens when try to use...
	#
	
	
	return;
	time.sleep (60)
	
	
	
	proceed_through_memo ({ "driver": driver_1 });
	Milieus_Navigate ({ "driver": driver_1, "location": [ "Wallet" ] });
	
	
	Milieus_Navigate ({ "driver": driver_1, "location": [ "Talents" ] });

	#
	#
	#	Open the Polytope
	#
	#	
	open_modal_button = loop (lambda : driver_1.find_element (
		By.CSS_SELECTOR, 
		'[monitor="Extension APT Throw"]'
	)) 
	open_modal_button.click ()

	

	''''
	change_net ({
		"driver": relatives_captain,
		"net_name": "devnet",
		"net_path": "https://api.devnet.aptoslabs.com/v1"
	})
	"'''
	time.sleep (60)
	
	
checks = {
	'check 1': check_1
}