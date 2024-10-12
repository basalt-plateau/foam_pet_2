

#/
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
#\

#/
#
this_directory_path = pathlib.Path (__file__).parent.resolve ()
geckodriver_path = str (normpath (join (this_directory_path, 'geckodriver')))
firefox_binary_path = str (normpath (join (this_directory_path, 'firefox/firefox-bin')))
#
#\

print ("firefox_binary_path:", firefox_binary_path)
print ("geckodriver_path:", geckodriver_path)



# Set up Firefox options
options = Options()
options.binary_location = firefox_binary_path
options.set_capability ('acceptInsecureCerts', True)

print ("options:", options)

# Set up the geckodriver service
service = Service(executable_path=geckodriver_path)
print ("service:", service)

# Initialize WebDriver
#driver = webdriver.Firefox(service=service, options=options)
driver = webdriver.Firefox (options=options)
print ("driver:", driver)

# Navigate to the URL
driver.get ('https://herb.trading')
print(driver.title)

# Close the browser
driver.quit()
