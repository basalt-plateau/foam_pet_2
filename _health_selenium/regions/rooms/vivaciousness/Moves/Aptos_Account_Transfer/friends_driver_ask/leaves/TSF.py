


#/
#
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness.procedures.Faucet.Give import give_Octas_from_faucet
#
from vivaciousness.procedures.loop import loop
#
#
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
#
#
import traceback
import json
import time
import multiprocessing
import concurrent.futures
#
#\

def TSF_Fields (packet):
	driver_1 = packet ["driver_1"]
	signature_hexadecimal_string = packet ["signature_hexadecimal_string"]
	
	transaction_signature_buttons = {}
	def check_for_transaction_signature_fields ():
		transaction_signature_buttons ["barcode_camera_button"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[transaction_signature_fields] span[barcode_camera_button]"
		)
		transaction_signature_buttons ["hexadecimal_button"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[transaction_signature_fields] span[hexadecimal_button]"
		)
	
	textareas = {}
	buttons = {}
	def check_for_transaction_signature_hexadecimal_string_fields ():
		textareas ["ST_hexadecimal_string"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[longevity=ST_hexadecimal_string]"
		)
		buttons ["ST_hexadecimal_string_add_button"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[longevity=ST_hexadecimal_string_add_button]"
		)
		
	def add_transaction_signature ():
		textareas ["ST_hexadecimal_string"].clear ()
		textareas ["ST_hexadecimal_string"].send_keys (signature_hexadecimal_string)
	
	def check_transaction_signature_textarea ():
		ST_hexadecimal_string_in_textarea = textareas ["ST_hexadecimal_string"].get_attribute ('value').strip ()
		assert (len (ST_hexadecimal_string_in_textarea) >= 10), ST_hexadecimal_string_in_textarea;
		
	def check_is_added ():
		assert buttons ["ST_hexadecimal_string_add_button"].get_attribute ('disabled') == 'true'
		
	#/
	#	Transaction Signature Fields
	#
	#
	loop (check_for_transaction_signature_fields)
	transaction_signature_buttons ["hexadecimal_button"].click ()
	loop (check_for_transaction_signature_hexadecimal_string_fields)
	add_transaction_signature ()
	
	
	loop (check_transaction_signature_textarea)
	buttons ["ST_hexadecimal_string_add_button"].click ()
	loop (check_is_added)
	
