
''''
	from vivaciousness.Milieus.navigate import Milieus_Navigate
	Milieus_Navigate ({
		"location": [ "Scholars", "Hints" ],
		"driver": driver
	});
"'''

''''
	click:
		Scholars button
	
	click:
		Hints button
"'''

from vivaciousness.procedures.loop import loop

from selenium.webdriver.common.by import By

import time

def Milieus_Navigate (packet):
	driver = packet ["driver"]
	location = packet ["location"]
	location_1 = location [0]
	location_2 = location [1]
	
	
	#
	#
	#	[monitor="navigator 1 structure"]
	#		button[monitor="Scholars"]
	#
	def click_button_1 ():
		def find_button ():
			return driver.find_element (
				By.CSS_SELECTOR, 
				f'[monitor="navigator 1 structure"] button[monitor="{ location_1 }"]'
			)
			
		button = loop (lambda : find_button ())
		button.click ();
			
		
	def click_button_2 ():
		def find_button ():
			return driver.find_element (
				By.CSS_SELECTOR, 
				f'[monitor="navigator 2 structure"] button[monitor="{ location_2 }"]'
			)
		
		button = loop (lambda : find_button ())
		button.click ();
		
	def click_technician_button ():
		def find_button ():
			return driver.find_element (
				By.CSS_SELECTOR, 
				f'[monitor="technicians buttons"] button[monitor="{ location_2 }"]'
			)
		
		button = loop (lambda : find_button ())
		button.click ();
		
		
	click_button_1 ();
	
	#print ("location_1:", location_1)
	#print ("location_2:", location_2)
	
	if (location_1 == "Technicians"):
		click_technician_button ()
	else:
		click_button_2 ();