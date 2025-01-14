
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
	location_at_index_0 = location [0]
	
	
	
	#
	#
	#	[monitor="navigator 1 structure"]
	#		button[monitor="Scholars"]
	#
	def click_index_0 ():
		def find_button ():
			return driver.find_element (
				By.CSS_SELECTOR, 
				f'[monitor="navigator 1 structure"] button[monitor="{ location_at_index_0 }"]'
			)
			
		button = loop (lambda : find_button ())
		button.click ();
			
		
	def click_index_1 ():
		def find_button ():
			return driver.find_element (
				By.CSS_SELECTOR, 
				f'[monitor="navigator 2 structure"] button[monitor="{ location [1] }"]'
			)
		
		button = loop (lambda : find_button ())
		button.click ();
		
	def click_technician_button ():
		def find_button ():
			return driver.find_element (
				By.CSS_SELECTOR, 
				f'[monitor="technicians buttons"] button[monitor="{ location [2] }"]'
			)
		
		button = loop (lambda : find_button ())
		
		#
		#	This scrolls to button.  Perhaps it can't be clicked unless it's in the view..
		#	
		#
		driver.execute_script("arguments[0].scrollIntoView(true);", button)
		button.click ();
		
		
	click_index_0 ();
	
	#print ("location_1:", location_1)
	#print ("location_2:", location_2)
	
	
		
	if (len (location) >= 2):
		location_at_index_1 = location [1]
		click_index_1 ();
	
		if (location [1] == "Resilience"):
			click_technician_button ()
			return;
		