


import os




def steady (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]

	screenplay = " ".join ([
		f"cd { location }",
		"&&",
		"aptos move test",
		f"--named-addresses 'Ride_01={ ride_plate }'"
	]);
	
	print ("screenplay:", screenplay);
	
	os.system (screenplay);
	
	
def publish (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]

	os.system (" ".join ([
		f"cd { location }",
		"&&",
		"aptos move publish",
		f"--named-addresses 'Ride_01={ ride_plate }'"
	]));

def build (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]


	os.system (" ".join ([
		f"cd { location }",
		"&&",
		"aptos move build",
		f"--named-addresses 'Ride_01={ ride_plate }'"
	]));