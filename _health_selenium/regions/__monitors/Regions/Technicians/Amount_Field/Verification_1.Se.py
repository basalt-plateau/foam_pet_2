
#
#
#	python3 health.proc.py run --path="Regions/Technicians/Amount_Field/Verification_1.Se.py"
#
#

#\
#
import time
#
#
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
#
#
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness._plays import retrieve_plays
from vivaciousness.modes import use_mode
from vivaciousness.procedures.loop import loop
from vivaciousness.Milieus.navigate import Milieus_Navigate
from vivaciousness.memo import proceed_through_memo
#
#/

def go_to_address ():
	driver_1 = connect_to_driver ();
	plays = retrieve_plays ()
	
	loop (lambda : use_mode (driver_1, "nurture"))
	
	URL = plays ["URL"]
	driver_1.get (URL)
	proceed_through_memo ({ "driver": driver_1 });
	
	
	Milieus_Navigate ({
		"location": [ "Technicians", "Amount Field" ],
		"driver": driver_1
	});
	
	return driver_1

def verify_amount_field (driver_1, the_packet):

	actual_amount_selector = "[monitor='actual amount of octas']"

	#
	#	field elements
	#
	#
	elements = {}
	def check_fields_existence ():
		elements ["currency_chooser"] = driver_1.find_element (By.CSS_SELECTOR, "[currency_chooser]")
		elements ["amount_field"] = driver_1.find_element (By.CSS_SELECTOR, "[amount_field]")
		elements ["actual_amount_of_octas"] = driver_1.find_element (
			By.CSS_SELECTOR, 
			actual_amount_selector
		)
	
	def currency_is (currency):
		assert (elements ["currency_chooser"].get_attribute ('value') == currency)
	
	#
	#	loop (lambda : input_amount_is ('9999'))
	#
	def input_amount_is (amount):
		assert (elements ["amount_field"].get_attribute ('value') == amount)
		
	def actual_amount_is (amount):
		assert (elements ["actual_amount_of_octas"].text == amount)
	
	def find_exception_element ():
		elements ["exception_text"] = None;
		elements ["exception_text"] = driver_1.find_element (By.CSS_SELECTOR, actual_amount_selector)
		
	def exception_text_is (text):
		assert (elements ["exception_text"].text == text)
		
	def change_amount (packet):
		currency = packet ["currency"]
		amount = packet ["amount"]
		Actual_Octas_Amount = packet ["Actual_Octas_Amount"]
	
		Select (elements ["currency_chooser"]).select_by_value (currency)
		loop (lambda : currency_is (currency))

		elements ["amount_field"].clear ()
		elements ["amount_field"].send_keys (amount)
		loop (lambda : input_amount_is (amount))
		
		loop (lambda : actual_amount_is (Actual_Octas_Amount))
		
	def exception_amount (packet):
		currency = packet ["currency"]
		amount = packet ["amount"]
		exception_text = packet ["exception_text"]
	
		Select (elements ["currency_chooser"]).select_by_value (currency)
		loop (lambda : currency_is (currency))
		
		elements ["amount_field"].clear ()
		elements ["amount_field"].send_keys (amount)
		loop (lambda : input_amount_is (amount))
		
		loop (lambda : actual_amount_is (""))
		
		# exception check
		loop (find_exception_element)
		loop (lambda : exception_text_is (""))
	
	loop (check_fields_existence)	
	
	if ("exception_text" in the_packet):
		loop (lambda : exception_amount (the_packet))
	
	else:
		loop (lambda : change_amount (the_packet))
	
	driver_1.quit ()

def check_1 ():
	verify_amount_field (go_to_address (), {
		"currency": "APT",
		"amount": "9999",
		"Actual_Octas_Amount": "99,99000,00000"
	})

def check_2 ():
	verify_amount_field (go_to_address (), {
		"currency": "Octas",
		"amount": "9999",
		"Actual_Octas_Amount": "9999"
	})
	
def exception_check_1 ():
	verify_amount_field (go_to_address (), {
		"currency": "APT",
		"amount": "11F",
		"exception_text": "The APT amount could not be converted into a fraction."
	})
	
def exception_check_2 ():
	verify_amount_field (go_to_address (), {
		"currency": "Octas",
		"amount": "11.1234",
		"exception_text": "Octas needs to be a natural number. (1, 2, 3, 4, 5, ...)"
	})
	
def exception_check_3 ():
	verify_amount_field (go_to_address (), {
		"currency": "APT",
		"amount": "11231231123123123.111122223",
		"exception_text": "The APT amount can't have more than 8 digits after the decimal point."
	})
	
checks = {
	'check 1': check_1,
	'check 2': check_2,
	
	'exception check 1': exception_check_1,
	'exception check 2': exception_check_2,
	'exception check 3': exception_check_3	
}