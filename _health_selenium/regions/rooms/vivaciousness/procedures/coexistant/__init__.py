



''''
coexistant ([
	lambda : loop (driver_1_check_fields),
	lambda : loop (driver_2_open_modal)
]);
"'''
def coexistant (definitions):
	tomorrows = []
	with concurrent.futures.ThreadPoolExecutor () as executor:
		for definition in definitions:
			tomorrows.append (executor.submit (definition))
		
		concurrent.futures.wait (tomorrows)
		
	return;