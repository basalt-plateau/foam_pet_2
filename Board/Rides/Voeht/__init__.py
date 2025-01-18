




import os
import pathlib
from os.path import dirname, join, normpath
import sys
	
this_directory = pathlib.Path (__file__).parent.resolve ()	



def roster ():
	players = []
	counter = 1;
	while (counter <= 10):
		players.append (f"""player_{ counter }={ player_1 ["legacy address"] }, """);
		counter += 1;


filter = "--filter steady_1"
filter = ""

def steady (envelope):
	ride_plate = envelope ["ride_plate"]
	named_addresses = envelope ["named_addresses"]
	
	print ("steady..");

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

	os.system (" ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move publish",
		named_addresses
	]));
