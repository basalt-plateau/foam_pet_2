




import os


filter = "--filter steady_remove_ending_zeroes"
# filter = ""

def steady (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]

	screenplay = " ".join ([
		f"cd { location }",
		"&&",
		"aptos move test",
		filter,
		f"--named-addresses 'Ride_01={ ride_plate }'"
	])
	
	print ("screenplay:", screenplay);

	os.system (screenplay);
	

	
def publish (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]

	screenplay = " ".join ([
		f"cd { location }",
		"&&",
		"aptos move publish",
		
		f"--named-addresses 'Ride_01={ ride_plate }'"
	])

	os.system (screenplay);
