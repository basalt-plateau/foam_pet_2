



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
	
	driver.get (URL)
	Milieus_Navigate ({
		"location": [ "Scholars", "Theme" ],
		"driver": driver
	});
	
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
	
	return 