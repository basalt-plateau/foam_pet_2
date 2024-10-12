
''''
	from connect import connect_to_driver
	driver = connect_to_driver ();
	driver.quit ()
"'''

#/
#
from vivaciousness._plays import retrieve_plays
#
#
from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options
#
#
import pathlib
from os.path import dirname, join, normpath
import sys
#
#
#\

#/
#
this_directory_path = pathlib.Path (__file__).parent.resolve ()
gecko_driver_path = str (normpath (join (this_directory_path, 'geckodriver')))
firefox_path = str (normpath (join (this_directory_path, 'firefox/firefox-bin')))
#
#\



# https://www.selenium.dev/documentation/webdriver/browsers/firefox/

def connect_to_driver ():
	plays = retrieve_plays ();


	print (f"""
	
	
		connect_to_driver:
		
			Firefox_path = "{ firefox_path }"
	
	
	
	""");

	#
	#	https://www.selenium.dev/documentation/webdriver/browsers/firefox/
	#	https://developer.mozilla.org/en-US/docs/Web/WebDriver/Capabilities/firefoxOptions
	#	https://github.com/SeleniumHQ/seleniumhq.github.io/blob/trunk/examples/python/tests/drivers/test_options.py
	#	https://github.com/SeleniumHQ/seleniumhq.github.io/blob/trunk/examples/python/tests/browsers/test_firefox.py
	#
	options = webdriver.FirefoxOptions ()
	options.binary_location = firefox_path	
	if (plays ["open browser"] != "yes"):
		options.add_argument("-headless")
	
	print (f"""
	
		options { options }
	
	""");
	
	
	#service = Service (executable_path = gecko_driver_path)
	
	driver = webdriver.Firefox (
		options = options
		#service = service
	)
	
	print (f"""
	
		driver { driver }
	
	
	
	""");
	
	return driver;

