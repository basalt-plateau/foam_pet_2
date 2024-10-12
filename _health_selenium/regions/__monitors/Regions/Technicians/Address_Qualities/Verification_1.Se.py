

#
#
#	There's an issue with the devnet API for this.
#
#


#
#	python3 health.proc.py run --path="Regions/Technicians/Address_Qualities/Verification_1.Se.py"
#
#

#/
#
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness._plays import retrieve_plays
from vivaciousness.modes import use_mode
#
from vivaciousness.procedures.loop import loop
from vivaciousness.regions.Seeds.Features.change_net import change_net
from vivaciousness.procedures.Faucet.Give import give_Octas_from_faucet
from vivaciousness.Milieus.navigate import Milieus_Navigate
from vivaciousness.memo import proceed_through_memo
#
#
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
#
#
import time
import json
#
#\


def check_1 ():
	driver_1 = connect_to_driver ();
	plays = retrieve_plays ()
	
	accounts = plays ["accounts"]
	
	URL = plays ["URL"]
	
	account_address = accounts ["1"] ["address"];
	
	driver_1.get (URL)
	proceed_through_memo ({ "driver": driver_1 });
	
	change_net ({
		"driver": driver_1,
		"net_name": "devnet",
		"net_path": "https://api.devnet.aptoslabs.com/v1"
	})
	
	#
	#	This occurs in another driver
	#	
	#
	give_Octas_from_faucet ({
		"icann_faucet_net_address": "https://faucet.devnet.aptoslabs.com/mint",
		"amount_of_octas": "1e4",
		"to_address": account_address
	})
	
	
	loop (lambda : use_mode (driver_1, "nurture"))
	
	
	driver_1.get (URL)
	Milieus_Navigate ({
		"location": [ "Technicians", "Address Qualities" ],
		"driver": driver_1
	});
	
	#
	#	field elements
	#
	#
	elements = {}
	def check_fields_existence ():
		elements ["address_hexadecimal_string"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"textarea[address_hexadecimal_string]"
		)
		elements ["address_qualities_proceeds"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[address_qualities_proceeds]"
		)		
	
	def change_address ():
		elements ["address_hexadecimal_string"].clear ()
		elements ["address_hexadecimal_string"].send_keys (account_address)
	
	def check_results ():
		text = elements ["address_qualities_proceeds"].text;
		print ('text:', text)
		
		results = json.loads (text)
		
		assert (results ["effective"] == "yes")
		assert (results ["address_hexadecimal_string"] == account_address)
		assert (results ["exception"] == "")
		
		
		
	
	loop (check_fields_existence)
	loop (change_address);
	loop (check_results);
	
	time.sleep (10)
	
checks = {
	'Address Qualities, can find address that exists on blockchain': check_1
}