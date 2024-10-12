# 
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

def Ask_Leaf (packet):
	driver_1 = packet ["driver_1"]
	
	# send_the_ask
	buttons = {}
	def check_for_transaction_signature_hexadecimal_string ():
		buttons ["send_the_ask"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[send_the_ask]"
		)

	alerts = {}
	def check_for_success ():
		alerts ["alert_success"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"aside[alert_success]"
		)
		driver_1.find_element (
			By.CSS_SELECTOR, 
			"[full_transaction_on_blockchain]"
		)
		
		

	loop (check_for_transaction_signature_hexadecimal_string)
	buttons ["send_the_ask"].click ()
	
	loop (check_for_success)
	
	
	return;
