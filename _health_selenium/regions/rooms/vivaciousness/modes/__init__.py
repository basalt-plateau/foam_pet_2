
''''
from vivaciousness.modes import use_mode
use_mode (driver_1, "nurture")
"'''

''''
from vivaciousness.modes import use_mode
use_mode (driver_1, "business")
"'''

from vivaciousness._plays import retrieve_plays

def use_mode (driver, mode):
	plays = retrieve_plays ()
	URL = plays ["URL"]

	driver.get (URL + "/")

	driver.execute_script (f"window.localStorage.setItem('mode', '{ mode }');")
	driver.refresh ()