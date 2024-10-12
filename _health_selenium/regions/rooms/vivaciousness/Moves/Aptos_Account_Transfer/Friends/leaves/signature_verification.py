




#\
#
from selenium.webdriver.common.by import By
#
#
from vivaciousness.procedures.loop import loop
#
#/


''''
	[monitor="signature verification leaf"]
		[monitor="bracket pad"]
		[monitor="hexadecimal pad"]
"'''

	

def monitor_signature_verification (packet):
	tailfin = packet ["tailfin"]
	
	leaf = '[monitor="signature verification leaf"]'
	
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
		tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="bracket pad"]'
		)
		tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="hexadecimal pad"]'
		)
		tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="signature bracket panel"] [code_wall_text]'
		)	
		
	loop (has_boats)
