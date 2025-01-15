


import os

estate_1_legacy_address = "9b30243a0cc51b6a59a0fbc2220adcb0601bf9627eb35400d5760a1292b4184d"


def establish ():
	os.system (" ".join ([
		"cd /Metro/Mottos/Lava",
		"&&",
		"aptos move run",
		f"--function-id { estate_1_legacy_address }::Lava::create_collection",
		"--assume-yes"
	]))


	
	
establish ();

