



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



def D_ST_Leaf (packet):
	driver_2 = packet ["driver_2"]
	inner_modal_buttons = packet ["inner_modal_buttons"]
	
	buttons = {}
	def check_field ():
		buttons ["barcode_button"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[transaction_signature] span[barcode_button]"
		)
		buttons ["object_button"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[transaction_signature] span[object_button]"
		)
		buttons ["hexadecimal_button"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[transaction_signature] span[hexadecimal_button]"
		)
		

		
	proceeds = {}
	spans = {}
	def check_signature_hexadecimal_string ():
		spans ["signature_hexadecimal_string"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[transaction_signature] [signature_hexadecimal_string] [code_wall_text]"
		)
		assert (
			len (spans ["signature_hexadecimal_string"].text) >= 10
		)
		
		proceeds ["signature_hexadecimal_string"] = spans ["signature_hexadecimal_string"].text
		
	#
	#	longevity=TS_hexadecimal_string
	#
	#
	
	loop (check_field)
	buttons ["hexadecimal_button"].click ()
	loop (check_signature_hexadecimal_string)
	
	
	return [
		proceeds ["signature_hexadecimal_string"]
	]
	
	
	
#