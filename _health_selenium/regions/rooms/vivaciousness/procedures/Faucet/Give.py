
''''
from vivaciousness.procedures.Faucet.Give import give_Octas_from_faucet
give_Octas_from_faucet ({
	"icann_faucet_net_address": "https://faucet.devnet.aptoslabs.com/mint",
	"amount_of_octas": "1e4",
	"to_address": "522D906C609A3D23B90F072AD0DC74BF857FB002E211B852CE38AD6761D4C8FD"
})
"'''




#/
#
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness._plays import retrieve_plays
from vivaciousness.modes import use_mode
from vivaciousness.Milieus.navigate import Milieus_Navigate
#
from vivaciousness.procedures.loop import loop
#
#
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
#
#
import traceback
import json
import time
import multiprocessing
import concurrent.futures
#
#\

from vivaciousness.memo import proceed_through_memo
	

def give_Octas_from_faucet (packet):
	amount_of_octas = packet ["amount_of_octas"]
	to_address = packet ["to_address"]
	icann_faucet_net_address = packet ["icann_faucet_net_address"]

	driver_1 = connect_to_driver ();
	plays = retrieve_plays ()
	URL = plays ["URL"]
	
	use_mode (driver_1, "nurture")
	
	driver_1.get (URL)
	proceed_through_memo ({
		"driver": driver_1
	});
	
	
	Milieus_Navigate ({
		"location": [ "Friends", "Talents" ],
		"driver": driver_1
	});
	
	
	def open_the_faucet_modal ():
		elements = {}
		def find_the_button ():
			elements ["faucet_button"] = driver_1.find_element (
				By.CSS_SELECTOR, 
				"[quests_address] button[faucet]"
			)
			
		loop (find_the_button)
		#loop (lambda : elements ["faucet_button"].click ());
		
		#actions = ActionChains (driver_1)
		#actions.move_to_element (elements ["faucet_button"]).click().perform()
		driver_1.execute_script("arguments[0].click();", elements ["faucet_button"])
	
	
	
	textareas = {}
	inputs = {}
	buttons = {}
	def find_fields ():
		textareas ["ican_net_address"] = driver_1.find_element (By.CSS_SELECTOR, "[ican_net_address]")
		textareas ["to_aptos_address"] = driver_1.find_element (By.CSS_SELECTOR, "[to_aptos_address]")
		inputs ["amount_of_octas"] = driver_1.find_element (By.CSS_SELECTOR, "[amount_of_octas]")
		buttons ["make_this_transaction"] = driver_1.find_element (By.CSS_SELECTOR, "[make_this_transaction]")
	
	#
	#	field choices
	#
	#
	def choose_fields ():
		textareas ["ican_net_address"].clear ()
		textareas ["ican_net_address"].send_keys (icann_faucet_net_address)
		
		textareas ["to_aptos_address"].clear ()
		textareas ["to_aptos_address"].send_keys (to_address)
		
		inputs ["amount_of_octas"].clear ()
		inputs ["amount_of_octas"].send_keys (amount_of_octas)
	
	p = {}
	def check_for_success_message ():
		p ["transaction_message_success"] = driver_1.find_element (By.CSS_SELECTOR, "[transaction_message_success]")

	open_the_faucet_modal ();

	loop (find_fields)
	loop (choose_fields)
	
	buttons ["make_this_transaction"].click ()
	
	loop (check_for_success_message)
	
	assert (
		p ["transaction_message_success"].text == "The transaction was successful."
	), p ["transaction_message_success"].text
	
	
	driver_1.quit ()
