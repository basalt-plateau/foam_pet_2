

#
#
#	python3 health.proc.py run --path="Regions/Technicians/Hone_Focus/Verification_1.Se.py"
#
#

#/
#
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness._plays import retrieve_plays
from vivaciousness.modes import use_mode
from vivaciousness.procedures.loop import loop
from vivaciousness.Milieus.navigate import Milieus_Navigate
from vivaciousness.memo import proceed_through_memo
#
#
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
#
#
import time
#
#\

def check_1 ():
	driver_1 = connect_to_driver ();
	plays = retrieve_plays ();
	URL = plays ["URL"]
	
	loop (lambda : use_mode (driver_1, "nurture"))
	
	driver_1.get (URL)
	proceed_through_memo ({ "driver": driver_1 });
	Milieus_Navigate ({
		"location": [ "Technicians", "Hone Focus" ],
		"driver": driver_1
	});
	
	#
	#	field elements
	#
	#
	elements = {}
	def check_fields_existence ():
		elements ["start_of_panel"] = driver_1.find_element (By.CSS_SELECTOR, "[start_of_panel]")
		elements ["end_of_panel"] = driver_1.find_element (By.CSS_SELECTOR, "[end_of_panel]")		
		elements ["the_panel"] = driver_1.find_element (By.CSS_SELECTOR, "[the_panel]")
		elements ["outside_button"] = driver_1.find_element (By.CSS_SELECTOR, "[outside_button]")
	
	loop (check_fields_existence)
	
	#
	#	end_of_panel -> start_of_panel
	#
	#
	elements ["end_of_panel"].click ()
	elements ["end_of_panel"].send_keys (Keys.TAB)
	active_element = driver_1.execute_script ("return document.activeElement")
	assert (active_element == elements ["start_of_panel"]), [
		active_element,
		elements ["start_of_panel"] 
	]
	
	
	#
	#	start_of_panel -> end_of_panel
	#
	#
	elements ["start_of_panel"].click ()
	elements ["start_of_panel"].send_keys (Keys.SHIFT + Keys.TAB)
	active_element = driver_1.execute_script ("return document.activeElement")
	assert (active_element == elements ["end_of_panel"]), [
		active_element,
		elements ["end_of_panel"] 
	]
	
	#
	#	start_of_panel -> escape
	#
	#
	elements ["start_of_panel"].click ()
	elements ["start_of_panel"].send_keys (Keys.ESCAPE)
	active_element = driver_1.execute_script ("return document.activeElement")
	assert (active_element == elements ["outside_button"]), [
		active_element,
		elements ["outside_button"] 
	]
	
	driver_1.quit ()
	
checks = {
	'check 1': check_1
}