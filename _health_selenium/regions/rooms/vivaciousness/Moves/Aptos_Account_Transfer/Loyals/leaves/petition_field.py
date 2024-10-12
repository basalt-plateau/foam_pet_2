

#\
#
from selenium.webdriver.common.by import By
#
#
from vivaciousness.procedures.loop import loop
#
#/

''''
	[monitor="petition field leaf"]
		[monitor="show barcode"]
		[monitor="show hexadecimal"]	

		[monitor="hexadecimal string panel"]
			textarea[monitor="hexadecimal string field"]
			button[monitor="add hexadecimal string"]
			
		[monitor="alert success text"]
"'''

def monitor_petition_field (packet):
	tailfin = packet ["tailfin"]
	petition_hexadecimal_string = packet ["petition_hexadecimal_string"]
	
	leaf = '[monitor="petition field leaf"]'
	alert_success_text = 'The petition was added.'
	
	def has_elements ():
		tailfin.find_element (
			By.CSS_SELECTOR, 
			leaf
		)
		tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="show barcode"]'
		)
		hexadecimal_button = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="show hexadecimal"]'
		)
		
		return hexadecimal_button;
		
		
	def has_barcode ():
		return;
		
	def has_hexadecimal_elements ():
		add_button = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="hexadecimal string panel"] button[monitor="add hexadecimal string"]'
		)
		field = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="hexadecimal string panel"] textarea[monitor="hexadecimal string field"]'
		)
		
		return [
			add_button,
			field
		]
		
	def add_hexadecimal (field, petition_hexadecimal_string):
		def check_hexadecimal_string ():
			assert (
				len (field.get_attribute ('value')) >= 1
			)
	
		field.clear ()
		field.send_keys (petition_hexadecimal_string)
	
		loop (check_hexadecimal_string)
	
		return;
	
	def has_alert_success ():
		element = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="alert success text"]'
		)
		
		assert (element.text == alert_success_text);
		
	
	hexadecimal_button = loop (lambda : has_elements ())
	hexadecimal_button.click ();
	
	[ add_button, field ] = loop (lambda : has_hexadecimal_elements ())
	
	add_hexadecimal (field, petition_hexadecimal_string);
	add_button.click ();
	
	loop (has_alert_success)