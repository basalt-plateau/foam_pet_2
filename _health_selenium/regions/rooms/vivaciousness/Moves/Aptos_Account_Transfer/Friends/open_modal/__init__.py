

#\
#
from selenium.webdriver.common.by import By
#
#
from vivaciousness.procedures.loop import loop
from vivaciousness.Milieus.navigate import Milieus_Navigate
#
#/



#
#	This opens the Modal.
#
#	outer_modal_buttons ["aptos_account_transfer"] = loop (lambda : open_the_modal (driver_1))
#
#
''''
	outer_modal_buttons ["aptos_account_transfer"] = loop (lambda : open_the_modal (driver_1))
	outer_modal_buttons ["aptos_account_transfer"].click ()
"'''
def open_the_modal (driver_1):
	def find_the_open ():
		return driver_1.find_element (
			By.CSS_SELECTOR, 
			"[aptos_account_transfer]"
		)
		
	open_modal_button = loop (lambda : find_the_open ()) 
	open_modal_button.click ()

#
#
#	[address-chooser-td] [nets-choices]
#
#
def check_for_inner_modal_buttons (tailfin):
	navigation_buttons = {}

	navigation_buttons ["next"] = tailfin.find_element (
		By.CSS_SELECTOR, 
		"button[modal-next]"
	)
	navigation_buttons ["back"] = tailfin.find_element (
		By.CSS_SELECTOR, 
		"button[modal-back]"
	)
	
	return navigation_buttons;



def open_friends_modal (packet):
	driver = packet ["driver"]
	# ICAN_DNS_Address = packet ["ICAN_DNS_Address"]
	
	#
	#
	#	Goto address
	#
	#
	Milieus_Navigate ({
		"location": [ "Friends", "Talents" ],
		"driver": driver
	});
	
	
	#
	#
	#	Modal
	#
	#	
	open_the_modal (driver);
	modal_navigation_buttons = loop (lambda : check_for_inner_modal_buttons (driver))
	
	
	return [
		modal_navigation_buttons
	]