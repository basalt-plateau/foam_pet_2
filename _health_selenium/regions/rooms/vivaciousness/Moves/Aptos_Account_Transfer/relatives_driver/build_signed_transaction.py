

#/
#
from .leaves.A_TP_Field import A_TP_Field
from .leaves.B_TP import B_TP_Leaf
from .leaves.C_TS_Field import C_TS_Field_Leaf
from .leaves.D_ST import D_ST_Leaf
#
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness.procedures.Faucet.Give import give_Octas_from_faucet
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




def build_ST_with_relatives (packet):
	driver_2 = packet ["driver_2"]
	driver_2_ICAN_DNS_Address = packet ["driver_2_ICAN_DNS_Address"]
	unsigned_transaction_hexadecimal_string = packet ["unsigned_transaction_hexadecimal_string"]
	account_1 = packet ["account_1"]
	
	assert (
		len (unsigned_transaction_hexadecimal_string) >= 1
	), unsigned_transaction_hexadecimal_string

	def goto_address ():
		driver_2.get (driver_2_ICAN_DNS_Address)
		
	# [unsigned_transaction_fields_leaf] [barcode_camera_button]
	# [unsigned_transaction_fields_leaf] [hexadecimal_field_button]
	
	#
	#	This is before the modal is opened.
	#
	#
	outer_modal_buttons = {}
	def check_for_modal_opener ():
		outer_modal_buttons ["aptos_account_transfer"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[signatures] button[aptos_account_transfer]"
		)
	
	
	#
	#	This is before the modal "next" and "back" buttons.
	#
	#
	inner_modal_buttons = {}
	def check_for_inner_modal_buttons ():
		inner_modal_buttons ["next"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"button[modal-next]"
		)
		inner_modal_buttons ["back"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"button[modal-back]"
		)
	
	#
	#	unsigned_transaction_leaf
	#
	#
	UT_buttons = {}
	def check_unsigned_transaction_leaf ():
		UT_buttons ["barcode_camera_button"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[unsigned_transaction_fields_leaf] [barcode_camera_button]"
		)
		UT_buttons ["hexadecimal_field_button"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[unsigned_transaction_fields_leaf] [hexadecimal_field_button]"
		)
		
	textareas = {}
	UT_hexadecimal_fields_buttons = {}
	def check_unsigned_transaction_hexadecimal_field ():
		textareas ["UT_hexadecimal_string"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[unsigned_transaction_fields_leaf] textarea[UT_hexadecimal_string]"
		)
		UT_hexadecimal_fields_buttons ["UT_hexadecimal_string_add_button"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"button[UT_hexadecimal_string_add_button]"
		)
		
		
	def add_UT_to_UT_field_textarea ():
		textareas ["UT_hexadecimal_string"].clear ()
		textareas ["UT_hexadecimal_string"].send_keys (unsigned_transaction_hexadecimal_string)
		
		
	def check_UT_field_textarea ():
		assert (
			len (textareas ["UT_hexadecimal_string"].get_attribute ('value')) >= 1
		)
	
	
	
		
	
	
	
	goto_address ();		
		
	#/
	#	open the modal
	#
	#
	loop (check_for_modal_opener)
	outer_modal_buttons ["aptos_account_transfer"].click ()
	loop (check_for_inner_modal_buttons)
	#
	#\
	
	#/
	#	transaction petition field leaf
	#
	#
	A_TP_Field ({
		"driver_2": driver_2,
		"TP_hexadecimal_string": unsigned_transaction_hexadecimal_string,
		"inner_modal_buttons": inner_modal_buttons
	});
	#
	#\
	
	inner_modal_buttons ["next"].click ()
	
	#/
	#	unsigned transaction leaf
	#
	#
	B_TP_Leaf ({
		"driver_2": driver_2,
		"inner_modal_buttons": inner_modal_buttons
	})
	#
	#\
	
	#/
	#	unsigned transaction signature leaf
	#
	#
	C_TS_Field_Leaf ({
		"driver_2": driver_2,
		"inner_modal_buttons": inner_modal_buttons,
		"account_1": account_1
	})
	#
	#\
	
	#/
	#	signed transaction leaf
	#
	#
	[ signature_hexadecimal_string ] = D_ST_Leaf ({
		"driver_2": driver_2,
		"inner_modal_buttons": inner_modal_buttons
	})
	#
	#\
	
	print (f"""
	
	
	
		[signature_hexadecimal_string___]: { signature_hexadecimal_string }
	
	
	
	
	""")

	return [ signature_hexadecimal_string ]

