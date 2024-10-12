



#/
#
from vivaciousness.procedures.loop import loop
#
#
from selenium.webdriver.common.by import By
#
#
import traceback
import json
import time
import multiprocessing
import concurrent.futures
#
#\




def C_TS_Field_Leaf (packet):
	driver_2 = packet ["driver_2"]
	inner_modal_buttons = packet ["inner_modal_buttons"]
	account_1 = packet ["account_1"]
	
	UTS_textareas = {}
	UTS_buttons = {}
	def UTS_check ():
		UTS_textareas ["private_key"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"textarea[private_key]"
		)
		UTS_buttons ["sign"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"button[sign]"
		)
		
	def UTS_add_private_key ():
		UTS_textareas ["private_key"].clear ()
		UTS_textareas ["private_key"].send_keys (account_1 ["private key"])
		
	def UTS_check_private_key ():
		assert (
			len (UTS_textareas ["private_key"].get_attribute ('value')) >= 10
		)
		
	pre = {}
	def verify_signed ():
		boat = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[private_key]"
		)
		private_key_string = boat.get_attribute ('value').strip ()
		assert (len (private_key_string) >= 10);
		assert UTS_buttons ["sign"].get_attribute ('disabled') == 'true'
		
		
	
	#/
	#
	loop (UTS_check)
	UTS_add_private_key ()
	loop (UTS_check_private_key)
	UTS_buttons ["sign"].click ()
	verify_signed ();
	#
	inner_modal_buttons ["next"].click ()
	#
	#\