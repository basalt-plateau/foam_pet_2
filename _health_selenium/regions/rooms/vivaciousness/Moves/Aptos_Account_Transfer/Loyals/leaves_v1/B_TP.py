

#
#	This is the leaf after the "Transaction Petition Field"
#
#



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




def B_TP_Leaf (packet):
	driver_2 = packet ["driver_2"]
	inner_modal_buttons = packet ["inner_modal_buttons"]
	
	buttons = {}
	def check_field ():
		buttons ["TP_hexadecimal_string_button"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[longevity=TP_hexadecimal_string_button]"
		)
		buttons ["TP_object_button"] = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[longevity=TP_object_button]"
		)

	def check_TP_Object ():
		return;
	
	
	#/
	#	This checks for the hexadecimal string
	#		unsigned_transaction_fiberized
	#
	def check_the_UT_hexadecimal_string ():
		boat = driver_2.find_element (
			By.CSS_SELECTOR, 
			"[tp_hexadecimal_string] [code_wall_text]"
		)
		TP_hexadecimal_string = boat.text.strip ()
		assert (len (TP_hexadecimal_string) >= 10);
	#
	#\
	
	
	loop (check_field)
	buttons ["TP_hexadecimal_string_button"].click ()
	
	loop (check_the_UT_hexadecimal_string)
	inner_modal_buttons ["next"].click ()