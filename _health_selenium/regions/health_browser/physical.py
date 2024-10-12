

#/
#
import pathlib
from os.path import dirname, join, normpath
import sys
#
from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options
#
#\

#/
#
this_directory_path = pathlib.Path (__file__).parent.resolve ()
gecko_driver_path = str (normpath (join (this_directory_path, 'geckodriver')))
firefox_path = str (normpath (join (this_directory_path, 'firefox/firefox-bin')))
#
#\

options = webdriver.FirefoxOptions ()
options.binary_location = firefox_path
#options.add_argument ("-headless")

print ("options:", options)


driver = webdriver.Firefox (options = options)
print ("driver:", driver)


# Set up the GeckoDriver service
#service = Service (gecko_driver_path)  # Replace with your GeckoDriver path if not in PATH

# Create a new Firefox driver instance
#driver = webdriver.Firefox (service=service)
#print ("driver:", driver)

#driver = webdriver.Firefox(executable_path=gecko_driver_path)


# Navigate to a website
driver.get("https://www.example.com")

# Print the title of the page
print(driver.title)

# Close the browser
driver.quit()
