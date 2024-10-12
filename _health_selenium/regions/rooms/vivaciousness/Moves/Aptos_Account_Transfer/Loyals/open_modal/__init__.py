


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
	
	Milieus_Navigate ({
		"location": [ "Loyals", "Signatures" ],
		"driver": tailfin
	});
	
	#
	#
	#	This is before the modal is opened.
	#
	#
	def check_for_modal_opener ():
		modal_open_button = tailfin.find_element (
			By.CSS_SELECTOR, 
			"[monitor='signatures leaf'] button[monitor='give']"
		)
		
		return modal_open_button;
		
		
	modal_open_button = loop (lambda : check_for_modal_opener ())
	modal_open_button.click ();
	
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