

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
	Milieus_Navigate ({ "driver": driver, "location": [ "Talents" ] });
	
	
	#
	#
	#	Open the Polytope
	#
	#	
	open_modal_button = loop (lambda : driver.find_element (
		By.CSS_SELECTOR, 
		'[monitor="APT Transfer Petition Frontier Button"]'
	)) 
	open_modal_button.click ()
	
	
	modal_navigation_buttons = loop (lambda : check_for_inner_modal_buttons (driver))
	
	
	return [
		modal_navigation_buttons
	]