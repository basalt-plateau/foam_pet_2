

''''

"'''

from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select

from vivaciousness.procedures.loop import loop

def check_the_petition_form (packet):
	driver_1 = packet ["driver_1"]
	address_from = packet ["address_from"]
	address_to = packet ["address_to"]
	amount_APT = packet ["amount_APT"]


	#
	#	field elements
	#
	#
	inputs = {}
	textareas = {}
	buttons = {}
	tds = {}
	selects = {}
	spans = {}
	def check_fields_existence ():
		spans ["icann_net_name"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			'[transaction_petition_fields] span[icann_net_name]'
		)
		spans ["icann_net_path"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			'[transaction_petition_fields] span[icann_net_path]'
		)
		
		textareas ["from_aptos_address"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[from_aptos_address] [address_hexadecimal_string]"
		)
		textareas ["to_aptos_address"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[to_aptos_address] [address_hexadecimal_string]"
		)
		selects ["currency_chooser"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[transaction_petition_fields] select[currency_chooser]"
		)
		inputs ["amount"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[transaction_petition_fields] input[amount_field]"
		)
		inputs ["transaction_expiration"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[transaction_petition_fields] [monitor='seconds until expiration']"
		)
	
	loop (check_fields_existence)
	
	
	#
	#	field choices
	#
	#
	def modify_fields ():
		textareas ["from_aptos_address"].clear ()
		textareas ["from_aptos_address"].send_keys (address_from)
		
		textareas ["to_aptos_address"].clear ()
		textareas ["to_aptos_address"].send_keys (address_to)
		
		inputs ["amount"].clear ()
		inputs ["amount"].send_keys (amount_APT)
		
		inputs ["transaction_expiration"].clear ()
		inputs ["transaction_expiration"].send_keys ('600')
	
	modify_fields ()
	
	#
	#
	#
	#
	#
	def check_field_contents ():
		assert (
			spans ["icann_net_name"].text ==
			'devnet'
		), spans ["icann_net_name"].text
		assert (
			spans ["icann_net_path"].text ==
			'https://api.devnet.aptoslabs.com/v1'
		), spans ["icann_net_path"].text
		
		assert (
			len (textareas ["from_aptos_address"].get_attribute ('value')) >= 1
		)
		assert (
			len (textareas ["to_aptos_address"].get_attribute ('value')) >= 1
		)
		
	loop (check_field_contents)

