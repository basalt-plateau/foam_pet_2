


import os




def steady (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]

	os.system (" ".join ([
		f"cd { location }",
		"&&",
		"aptos move test",
		f"--named-addresses 'ride={ ride_plate }'"
	]));
	
	
	
def publish (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]

	os.system (" ".join ([
		f"cd { location }",
		"&&",
		"aptos move publish",
		f"--named-addresses 'ride={ ride_plate }'"
	]));

def build (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]


	os.system (" ".join ([
		f"cd { location }",
		"&&",
		"aptos move build",
		f"--named-addresses 'ride={ ride_plate }'"
	]));