

''''
	[ petition_as_hexadecimal ] = check_the_petition ({
		"driver_1": driver_1
	})
"'''


from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select

from vivaciousness.procedures.loop import loop
from vivaciousness.Moves.Aptos_Account_Transfer.TP_Object_Checks.TP_1 import check_TP_Object


def check_the_petition (packet):
	driver_1 = packet ["driver_1"]

	#
	#
	#	proceeds [ "petition_as_hexadecimal" ]
	#
	#
	proceeds = {}

	#
	#
	#	unsigned_transaction_leaf
	#
	#
	petition_buttons = {}
	def has_elements ():
		petition_buttons ["hexadecimal"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[monitor='petition leaf'] [monitor='hexadecimal']"
		)
		petition_buttons ["barcode"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[monitor='petition leaf'] [monitor='barcode']"
		)
	
	
	
	#
	#
	#	This checks for the "petition" hexadecimal string
	#
	#
	def has_hexadecimal_string ():
		boat = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[monitor='petition leaf'] [monitor='hexadecimal'] [code_wall_text]"
		)
		
		assert (len (boat.text) >= 1);
		proceeds [ "petition_as_hexadecimal" ] = boat.text.strip ()
	
	
	
	def has_barcode ():
		barcode_code_element = driver_1.find_element (
			By.CSS_SELECTOR, 
			"[monitor='petition leaf'] [monitor='barcode visual'] [monitor='zxing barcode']"
		)
		
		svg_elements = barcode_code_element.find_elements (By.CSS_SELECTOR, "svg")
		assert (len (svg_elements) == 1);
		
		#print ("svg_elements:", svg_elements)
		
	
	
	loop (has_elements);
	
	petition_buttons ["barcode"].click ()
	loop (has_barcode);
	
	petition_buttons ["hexadecimal"].click ()	
	loop (has_hexadecimal_string);

	

	return [
		proceeds [ "petition_as_hexadecimal" ]
	];
	