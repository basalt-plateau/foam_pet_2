




import os
import pathlib
from os.path import dirname, join, normpath
import sys
	
this_directory = pathlib.Path (__file__).parent.resolve ()	

filter = "--filter steady_address_as_string_01"


def steady (envelope):
	ride_plate = envelope ["ride_plate"]
	named_addresses = envelope ["named_addresses"]

	os.system (" ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move test",
		filter,
		named_addresses
	]));
	
	
	
def publish (envelope):
	ride_plate = envelope ["ride_plate"]
	named_addresses = envelope ["named_addresses"]

	os.system (" ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move publish",
		named_addresses
	]));
