









''''
	monitor_signature ({
		"tailfin": tailfin
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
	[monitor="signature leaf"]
		[monitor="barcode pad"]
		[monitor="hexadecimal pad"]
"'''


def monitor_signature (packet):
	tailfin = packet ["tailfin"]
	
	leaf = '[monitor="signature leaf"]'
	
	def has_elements ():
		tailfin.find_element (By.CSS_SELECTOR, leaf)
		barcode_pad = tailfin.find_element (By.CSS_SELECTOR, f'{ leaf } [monitor="barcode pad"]')
		hexadecimal_pad = tailfin.find_element (By.CSS_SELECTOR, f'{ leaf } [monitor="hexadecimal pad"]')
	
		return [
			barcode_pad,
			hexadecimal_pad
		]
	
	[ barcode_pad, hexadecimal_pad ] = loop (has_elements)
	
	
	def has_barcode ():
		barcode_code_element = tailfin.find_element (
			By.CSS_SELECTOR, 
			f"{ leaf } [monitor='barcode visual'] [monitor='zxing barcode']"
		)
		
		svg_elements = barcode_code_element.find_elements (By.CSS_SELECTOR, "svg")
		assert (len (svg_elements) == 1);
	
	
	barcode_pad.click ();
	loop (has_barcode);
	
	def has_hexadecimal ():
		hexadecimal_string = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{ leaf } [monitor="hexadecimal string"] [code_wall_text]'
		)
		
		text = hexadecimal_string.text
		assert (len (text) >= 1), text
		
		return text
	
	hexadecimal_pad.click ();
	signature_hexadecimal_string = loop (has_hexadecimal);
	
	assert (len (signature_hexadecimal_string) >= 1)
	
	
	
	
	return [
		signature_hexadecimal_string
	]


