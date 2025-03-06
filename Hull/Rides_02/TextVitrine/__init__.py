




import os
import pathlib
from os.path import dirname, join, normpath
import sys
	
this_directory = pathlib.Path (__file__).parent.resolve ()	


filter = ""
filter = "--filter Texts_Preferential"

def steady (envelope):
	named_addresses = envelope ["named_addresses"]
	
	screenplay = " ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move test",
		"--ignore-compile-warnings",
		filter,
		named_addresses
	]);
	
	print ("screenplay:", screenplay);
	
	os.system (screenplay);
	os.system (f"cd '{ this_directory }' && chmod -R 777 .")
	
	
def publish (envelope):
	ride_plate = envelope ["ride_plate"]
	named_addresses = envelope ["named_addresses"]

	screenplay = " ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move publish",
		named_addresses
	]);
	
	print ("screenplay:", screenplay);

	os.system (screenplay);
