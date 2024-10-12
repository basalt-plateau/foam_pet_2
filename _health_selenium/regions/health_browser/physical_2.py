
#
#	docker run --add-host=host.docker.internal:host-gateway my-docker-image
#	curl http://host.docker.internal:4444/wd/hub
#

from selenium import webdriver

# Define the URL of the Selenium Grid
grid_url = 'http://localhost:4444/wd/hub'

# Set up the WebDriver for Firefox
options = webdriver.FirefoxOptions ()
options.set_capability ('acceptInsecureCerts', True)
print ("options:", options)

service = Service(executable_path=geckodriver_path)
print ("service:", service)

driver = webdriver.Remote (
	command_executor = grid_url, 
	options = options
)
print ("driver:", driver)


# Example test script
driver.get ('https://localhost/friends')
print (driver.title)

# Close the browser
driver.quit ()
