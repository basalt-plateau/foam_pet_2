


import os
import pathlib

this_directory = pathlib.Path (__file__).parent.resolve ()	


def steady (envelope):
	ride_plate = envelope ["ride_plate"]
	named_addresses = envelope ["named_addresses"]

	print ("named_addresses:", named_addresses)

	screenplay = " ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move test",
		named_addresses
	]);
	
	print ("screenplay:", screenplay);
	
	os.system (screenplay);
	
	
def publish (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]

	os.system (" ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move publish",
		f"--named-addresses 'Ride_01={ ride_plate }'"
	]));
	

def build (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]


	os.system (" ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move build",
		f"--named-addresses 'Ride_01={ ride_plate }'"
	]));