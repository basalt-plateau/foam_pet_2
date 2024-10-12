







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
	[monitor="signature verfication leaf"]
		[monitor="signature bracket panel"]
			[code_wall_text]
"'''



def monitor_signature_verification (packet):
	tailfin = packet ["tailfin"]
	
	leaf = '[monitor="signature verfication leaf"]'
	
	def has_elements ():
		tailfin.find_element (By.CSS_SELECTOR, leaf)
		tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="signature bracket panel"] [code_wall_text]'
		)	
	
	loop (has_elements)

	
	
	
	
	
	
	
	return;


