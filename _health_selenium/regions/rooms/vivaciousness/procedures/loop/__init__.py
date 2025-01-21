
''''
	def fn_1 ():
		return;

	from vivaciousness.procedures.loop import loop
	loop (fn_1)
"'''

''''
	def fn_1 (param):
		print ("param:", param)

	from vivaciousness.procedures.loop import loop
	loop (lambda : fn_1 ("1"))
"'''

''''
def go ():
	def find_button ():
		return driver.find_element (
			By.CSS_SELECTOR, 
			f'button[monitor="Greetings"]'
		)
	
	button = loop (lambda : find_button ())
	
	driver.execute_script("arguments[0].scrollIntoView(true);", button)
	button.click ();

go ();
"'''

import time
import traceback


def loop (action, limit = 10, current = 0):
	print ("""
	
		Attempting to connect to driver.
	
	""")

	try:
		return action ()
	except Exception as E:
		print ("E:", E)
		traceback_str = ''.join(traceback.format_exception (type(E), E, E.__traceback__))
		print ("traceback", traceback_str)
	
	current += 1
	if (current <= limit):
		time.sleep (.5)		
		return loop (action, current = current)
		
	raise Exception ("loop limit reached")