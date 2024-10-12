


#
#
#	python3 health.proc.py run --path="Regions/Loyals/Addresses/From_Private_Key.Se.py"
#
#

#/
#
from vivaciousness.procedures.loop import loop
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness._plays import retrieve_plays
from vivaciousness.memo import proceed_through_memo
from vivaciousness.Milieus.navigate import Milieus_Navigate
#
#
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
#
#
import time
#
#\


	

def check_1 ():
	driver = connect_to_driver ();
	plays = retrieve_plays ()
	URL = plays ["URL"]
	
	driver.get (URL)
	proceed_through_memo ({ "driver": driver });
	Milieus_Navigate ({
		"location": [ "Loyals", "Accounts" ],
		"driver": driver
	});
	
	
	def open_panels__single_key_account__from_hexadecimal ():
		these_element = {}
		
		def find_element_1 ():
			button = driver.find_element (
				By.CSS_SELECTOR, 
				'[monitor="accounts"] [monitor="EEC 25519 Single Key"]'
			)
			button.click ();
			
			
		def find_element_2 ():
			button = driver.find_element (
				By.CSS_SELECTOR, 
				'[monitor="accounts"] [monitor="from hexadecimal"]'
			)
			button.click ();
	
		#
		# 	loop find:
		#		monitor="EEC 25519 Single Key"
		#
		loop (lambda : find_element_1 ())
		loop (lambda : find_element_2 ())
	
	
	choosies = {}
	def open_the_region ():
		def find_key_count_select ():
			choosies ["keys_count"] = Select (driver.find_element (
				By.CSS_SELECTOR, 
				'main[addresses] select[keys_count]'
			))
			
		def find_key_single_key_select ():
			choosies ["single_key_address_navigator"] = Select (driver.find_element (
				By.CSS_SELECTOR, 
				'main[addresses] select[single_key_address_navigator]'
			))
	
		loop (find_key_count_select);
		choosies ["keys_count"].select_by_value ("EEC_25519_single_key_account");
		
		loop (find_key_single_key_select);
		choosies ["single_key_address_navigator"].select_by_value ("from_private_key_hexadecimal")
	
	
	def find_an_address ():
		fields = {}
		displays = {}
		def find_fields ():
			fields ["private_key_hexadecimal_textarea"] = driver.find_element (
				By.CSS_SELECTOR, 
				'[address_from_private_key] textarea[private_key_hexadecimal]'
			)
			fields ["calculate_account"] = driver.find_element (
				By.CSS_SELECTOR, 
				'[address_from_private_key] button[calculate_account]'
			)
			
		def find_display ():
			displays ["address_hexadecimal_string"] = driver.find_element (
				By.CSS_SELECTOR, 
				'[address_from_private_key] p[address_hexadecimal_string]'
			)
			displays ["legacy_address_hexadecimal_string"] = driver.find_element (
				By.CSS_SELECTOR, 
				'[address_from_private_key] p[legacy_address_hexadecimal_string]'
			)
			displays ["private_key_hexadecimal_textarea"] = driver.find_element (
				By.CSS_SELECTOR, 
				'[address_from_private_key] p[private_key_hexadecimal_string]'
			)
			displays ["public_key_hexadecimal_string"] = driver.find_element (
				By.CSS_SELECTOR, 
				'[address_from_private_key] p[public_key_hexadecimal_string]'
			)
			
		def choose_private_key ():
			private_key_hexadecimal = "889ABCFED89736504127603417265389FAEDBC8F9EDABCFEB014276354526135"
		
			fields ["private_key_hexadecimal_textarea"].clear ()
			fields ["private_key_hexadecimal_textarea"].send_keys (private_key_hexadecimal)
			
			def input_amount_is (boat, amount):
				assert (
					boat.get_attribute ('value') == 
					private_key_hexadecimal
				)
			
			loop (lambda : input_amount_is (fields ["private_key_hexadecimal_textarea"], private_key_hexadecimal))
			
			fields ["calculate_account"].click ()
		
		def verify_the_presentation ():
			assert (
				displays ["address_hexadecimal_string"].text ==
				'7E7EEBEBF33265CE3E1400B0C925A67507D50231F064BFC117ACC277FDC50486'
			), elements ["address_hexadecimal_string"].text
			assert (
				displays ["legacy_address_hexadecimal_string"].text ==
				'FD9DF45072990DF6DA2EF8041FCAB4F94B33502C6245CE880621F24C7ED23CE0'
			), elements ["legacy_address_hexadecimal_string"].text
			assert (
				displays ["private_key_hexadecimal_textarea"].text ==
				'889ABCFED89736504127603417265389FAEDBC8F9EDABCFEB014276354526135'
			), elements ["private_key_hexadecimal_textarea"].text
			assert (
				displays ["public_key_hexadecimal_string"].text ==
				'75D3BADCA887855775AAE3DF26733A8C0C8CC262F8FA1FD3428843A83628ED37'
			), elements ["public_key_hexadecimal_string"].text
			
		loop (find_fields)
		loop (find_display)
		
		choose_private_key ()
		verify_the_presentation ();
		
		
		
	open_panels__single_key_account__from_hexadecimal ();
	#open_the_region ()
	find_an_address ()

	
checks = {
	'can choose an address from a private key': check_1
}