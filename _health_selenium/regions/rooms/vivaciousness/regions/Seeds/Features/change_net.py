



''''
from vivaciousness.regions.Seeds.Features.change_net import change_net
change_net ({
	"driver": "",
	"net_name": "mainnet",
	"net_path": "https://api.mainnet.aptoslabs.com/v1"
})
"'''


#/
#
from vivaciousness._plays import retrieve_plays
from vivaciousness.procedures.loop import loop
#
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
#
import time
#
#\

from vivaciousness.Milieus.navigate import Milieus_Navigate
from vivaciousness.modes import use_mode


#
#	nets-choices
#
#
def change_net (packet):
	net_name = packet ["net_name"]
	net_path = packet ["net_path"]	
	driver = packet ["driver"]
	
	plays = retrieve_plays ();
	URL = plays ["URL"]
	
	
	use_mode (driver, "nurture")
	
	driver.get (URL)
	Milieus_Navigate ({
		"location": [ "Talents" ],
		"driver": driver
	});
	
	
	#
	#
	#	monitor="dapp network frontier"
	#
	#
	def open_dapp_network ():
		buttons = {}
		def search_element ():
			buttons ["dapp_network"] = driver.find_element (
				By.CSS_SELECTOR, 
				'[monitor="dapp network frontier"]'
			)
		
		loop (search_element);
		buttons ["dapp_network"].click ();
		
	open_dapp_network();
	
	#
	#	field elements
	#
	#
	elements = {}
	def check_fields_existence ():
		elements ["nets_choices"] = driver.find_element (
			By.CSS_SELECTOR, 
			"[net_group_choices] select[nets-choices]"
		)
		elements ["icann_net_address"] = driver.find_element (
			By.CSS_SELECTOR, 
			"[net_group_choices] [icann_net_address]"
		)
	
	def choose_net ():
		Select (elements ["nets_choices"]).select_by_value (net_name)
	
	def check_net_address ():
		assert (
			elements ["icann_net_address"].text == net_path
		), [
			elements ["icann_net_address"].text,
			net_path
		]
	
	loop (check_fields_existence)
	choose_net ()
	loop (check_net_address)
	
	def close ():
		button = loop (lambda : driver.find_element (
			By.CSS_SELECTOR, 
			f'[monitor="polytope_2 exit"]'
		));
		driver.execute_script("arguments[0].click();", button)
		
	close ();
	
	return 