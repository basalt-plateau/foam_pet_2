








#\
#
import time
#
#
from selenium.webdriver.common.by import By
#
#
from vivaciousness.procedures.loop import loop
#
#/

	
''''
	[monitor="suggestion leaf"]
		button[monitor="suggestion pad"]
"'''
		
	
def monitor_suggestion (packet):
	tailfin = packet ["tailfin"]
	
	leaf = '[monitor="suggestion leaf"]'
	
	#
	#
	#	buttons
	#
	#
	def has_boats ():
		tailfin.find_element (
			By.CSS_SELECTOR, 
			leaf
		)
		suggestion_pad = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } button[monitor="suggestion pad"]'
		)
		
		return [ suggestion_pad ]

	[ suggestion_pad ] = loop (has_boats)
	suggestion_pad.click ();
	
	
	def was_successful ():
		suggestion_pad = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="ask was successful"]'
		)
	
	
	loop (was_successful)
	
	# The consensus added the transaction to the blockchain.
	
	#time.sleep (60)
	