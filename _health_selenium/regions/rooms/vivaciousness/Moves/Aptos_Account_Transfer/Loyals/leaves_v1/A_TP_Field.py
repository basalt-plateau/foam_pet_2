



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




def A_TP_Field (packet):
	driver_2 = packet ["driver_2"]
	inner_modal_buttons = packet ["inner_modal_buttons"]
	TP_hexadecimal_string = packet ["TP_hexadecimal_string"]
	
	#
	#	unsigned_transaction_leaf
	#
	#
	tabs = {}
	def check_unsigned_transaction_leaf ():
		tabs ["barcode_camera_button"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[transaction_petition_field_leaf] [barcode_camera_button]"
		)
		tabs ["hexadecimal_field_button"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[transaction_petition_field_leaf] [hexadecimal_field_button]"
		)
		
	textareas = {}
	hexadecimal_fields_buttons = {}
	def check_unsigned_transaction_hexadecimal_field ():
		textareas ["TP_hexadecimal_string"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[transaction_petition_field_leaf] [hexadecimal_string_panel] textarea[TP_hexadecimal_string]"
		)
		hexadecimal_fields_buttons ["TP_hexadecimal_string_add_button"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[transaction_petition_field_leaf] [hexadecimal_string_panel] button[TP_hexadecimal_string_add_button]"
		)
		
		
	def add_UT_to_UT_field_textarea ():
		textareas ["TP_hexadecimal_string"].clear ()
		textareas ["TP_hexadecimal_string"].send_keys (TP_hexadecimal_string)
		
		
	def check_TP_hexadecimal_string ():
		assert (
			len (textareas ["TP_hexadecimal_string"].get_attribute ('value')) >= 1
		)
		
	#/
	#	unsigned transaction fields leaf
	#
	#
	loop (check_unsigned_transaction_leaf)
	#
	tabs ["hexadecimal_field_button"].click ()
	loop (check_unsigned_transaction_hexadecimal_field)
	#
	add_UT_to_UT_field_textarea ()
	loop (check_TP_hexadecimal_string)
	#
	hexadecimal_fields_buttons ["TP_hexadecimal_string_add_button"].click ()
	#
	#\