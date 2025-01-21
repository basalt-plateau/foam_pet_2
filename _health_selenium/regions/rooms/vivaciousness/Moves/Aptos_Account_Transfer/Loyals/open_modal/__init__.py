


''''
	[ relatives_modal_navigation_buttons ] = open_relatives_modal ({
		"tailfin": driver,
		"ICAN_DNS_Address": ""
	})
"'''

#\
#
from selenium.webdriver.common.by import By
#
#
from vivaciousness.procedures.loop import loop
from vivaciousness.Milieus.navigate import Milieus_Navigate
#
#/





def open_relatives_modal (packet):
	tailfin = packet ["tailfin"]
	
	# ICAN_DNS_Address = packet ["ICAN_DNS_Address"]
	# tailfin.get (ICAN_DNS_Address)
	

	from vivaciousness.Milieus.navigate import Milieus_Navigate_to_Greetings
	Milieus_Navigate_to_Greetings ({ "driver": tailfin });
		
	def open_consent_panel ():
		button = loop (lambda : tailfin.find_element (
			By.CSS_SELECTOR, 
			f'[monitor="consent opener"]'
		));
		#driver.execute_script("arguments[0].click();", button)
		
		tailfin.execute_script("arguments[0].scrollIntoView(true);", button)
		button.click ();
	
	open_consent_panel ();
	
	#
	#
	#	This is before the modal is opened.
	#
	#
	def open_polytope ():
		modal_open_button = loop (lambda : tailfin.find_element (
			By.CSS_SELECTOR, 
			"[monitor='signatures leaf'] button[monitor='APT Transfer Consent Frontier Button']"
		))
		modal_open_button.click ();
		
	open_polytope ();
		
	
	
	#
	#
	#	This is before the modal "next" and "back" buttons.
	#
	#
	def check_for_modal_navigation_buttons ():
		modal_navigation_buttons = {}
		modal_navigation_buttons ["next"] = tailfin.find_element (
			By.CSS_SELECTOR, 
			"button[modal-next]"
		)
		modal_navigation_buttons ["back"] = tailfin.find_element (
			By.CSS_SELECTOR, 
			"button[modal-back]"
		)
		
		return modal_navigation_buttons;
	
	
	modal_navigation_buttons = loop (lambda : check_for_modal_navigation_buttons ())
	
	
	return [
		modal_navigation_buttons
	]