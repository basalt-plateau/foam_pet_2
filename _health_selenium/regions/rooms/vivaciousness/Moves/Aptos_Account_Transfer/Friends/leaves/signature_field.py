


#\
#
from selenium.webdriver.common.by import By
#
#
from vivaciousness.procedures.loop import loop
#
#/


''''
	[monitor="signature field leaf"]
		[monitor="barcode pad"]
		[monitor="hexadecimal pad"]
		
	[monitor="hexadecimal panel"]
		textarea[monitor="hexadecimal string"]
		button[monitor="add hexadecimal string"]
"'''

def add_hexadecimal_text (
	signature_hexadecimal_string,
	hexadecimal_string_textarea
):
	def check_hexadecimal_string ():
		assert (
			len (hexadecimal_string_textarea.get_attribute ('value')) >= 1
		)

	hexadecimal_string_textarea.clear ()
	hexadecimal_string_textarea.send_keys (signature_hexadecimal_string)

	loop (check_hexadecimal_string)
	
	
def is_added (tailfin, leaf):
	info_alert_text = tailfin.find_element (
		By.CSS_SELECTOR, 
		f'{ leaf } [monitor="signature alert text"]'
	)
	
	text = info_alert_text.text
	assert (text == "The signature was added."), text
	

def monitor_signature_field (packet):
	tailfin = packet ["tailfin"]
	signature_hexadecimal_string = packet ["signature_hexadecimal_string"]
	
	leaf = '[monitor="signature field leaf"]'
	
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
		barcode_pad = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="barcode pad"]'
		)
		hexadecimal_pad = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="hexadecimal pad"]'
		)
		
		return [ barcode_pad, hexadecimal_pad ]
		
	[ barcode_pad, hexadecimal_pad ] = loop (has_boats)
	hexadecimal_pad.click ();
	
	#
	#
	#	hexadecimal panel
	#
	#
	def has_hexadecimal_boats ():
		hexadecimal_string_textarea = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } textarea[monitor="hexadecimal string"]'
		)
		add_hexadecimal_string_button = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } button[monitor="add hexadecimal string"]'
		)	
		
		return [ 
			add_hexadecimal_string_button, 
			hexadecimal_string_textarea
		] 
		
	[ 
		add_hexadecimal_string_button, 
		hexadecimal_string_textarea 
	] = loop (has_hexadecimal_boats)
	

	add_hexadecimal_text (
		signature_hexadecimal_string,
		hexadecimal_string_textarea
	)
	
	add_hexadecimal_string_button.click ();
	
	#
	#
	#	checks the for info alert that was added.
	#
	#
	loop (lambda : is_added (tailfin, leaf))
	
	#