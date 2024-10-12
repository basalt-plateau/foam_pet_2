


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

def TS_Fields (packet):
	driver_1 = packet ["driver_1"]
	signature_hexadecimal_string = packet ["signature_hexadecimal_string"]
		
		
	transaction_signature_buttons = {}
	def check_for_transaction_signature_boats ():
		transaction_signature_buttons ["barcode_camera_button"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[transaction_signature] span[transaction_signature_object]"
		)
		transaction_signature_buttons ["hexadecimal_button"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[transaction_signature] span[transaction_signature_hexadecimal_string]"
		)
		
		
		
	# 
	def check_for_transaction_signature_hexadecimal_string ():
		transaction_signature_buttons ["transaction_signature_hexadecimal_string"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[transaction_signature_hexadecimal_string]"
		)
		assert (
			len (transaction_signature_buttons ["transaction_signature_hexadecimal_string"].text) >= 10
		)
	
		
	loop (check_for_transaction_signature_boats)
	transaction_signature_buttons ["hexadecimal_button"].click ()
	loop (check_for_transaction_signature_hexadecimal_string)
	
	
	
	
	
	
	
	
#