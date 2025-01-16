




import os
import pathlib
from os.path import dirname, join, normpath
import sys
	
this_directory = pathlib.Path (__file__).parent.resolve ()	



def steady (envelope):
	ride_plate = envelope ["ride_plate"]
	named_addresses = envelope ["named_addresses"]

	os.system (" ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move test",
		named_addresses
	]));
	
	
	
def publish (envelope):
	ride_plate = envelope ["ride_plate"]

	os.system (" ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move publish",
		f"--named-addresses 'ride={ ride_plate }'"
	]));
