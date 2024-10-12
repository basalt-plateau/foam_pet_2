





''''
	monitor_signature_field ({
		"tailfin": tailfin,
		"origin_private_key": origin_private_key
	})
"'''







#\
#
import time
import json
#
#
from selenium.webdriver.common.by import By
#
#
from vivaciousness._plays import retrieve_plays
from vivaciousness.procedures.loop import loop
#
#/

''''
	[monitor="signature field leaf"]
		textarea[monitor="private key"]
		button[monitor="sign"]
		
		[monitor="address is legacy lot"] input
			
"'''

import time

def is_signed (sign_button):
	text = sign_button.text;

	assert (text == "Signed"), text

def add_private_key (field, origin_private_key):
	def check_hexadecimal_string ():
		assert (len (field.get_attribute ('value')) >= 1)

	field.clear ()
	field.send_keys (origin_private_key)
	
	loop (check_hexadecimal_string)

def monitor_signature_field (packet):
	tailfin = packet ["tailfin"]
	origin_private_key = packet ["origin_private_key"]
	origin_address_is_legacy = packet ["origin_address_is_legacy"]
	
	
	leaf = '[monitor="signature field leaf"]'
	
	
	def has_elements ():
		tailfin.find_element (
			By.CSS_SELECTOR, 
			leaf
		)
		field = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } textarea[monitor="private key"]'
		)

		sign_button = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } button[monitor="sign"]'
		)
		
		address_is_legacy_lot = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="address is legacy lot"]'
		)
		
		address_is_legacy_toggle = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="address is legacy lot"] input'
		)
		
		return [ field, sign_button, address_is_legacy_toggle ]
	
	def wait_for_checked (address_is_legacy_toggle):
		assert (address_is_legacy_toggle.is_selected () == True)
	
	[ field, sign_button, address_is_legacy_toggle ] = loop (has_elements)
	add_private_key (field, origin_private_key)
	
	if (origin_address_is_legacy == "yes"):
		#address_is_legacy_toggle.click ();
		
		tailfin.execute_script ("arguments[0].click();", address_is_legacy_toggle)
		
		loop (lambda : wait_for_checked (address_is_legacy_toggle));
	
	sign_button.click ()
	
	loop (lambda : is_signed (sign_button))
	
		
	time.sleep (10)
	
	
	
	
	
	
	return;


