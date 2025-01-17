


import os

estate_1_legacy_address = "9b30243a0cc51b6a59a0fbc2220adcb0601bf9627eb35400d5760a1292b4184d"

def faucet ():
	os.system (" ".join ([
		"aptos account fund-with-faucet"
	]))

def establish ():
	amount = 1000

	os.system (" ".join ([
		"cd /Metro/Mottos/Pergola",
		"&&",
		"aptos move run",
		f"--function-id { estate_1_legacy_address }::Pergola_Taffoni::add_AptosCoin_to_Taffoni",
		f"--args u64:{ amount }",
		"--assume-yes"
	]))

def demolish ():
	

	os.system (" ".join ([
		"cd /Metro/Mottos/Pergola",
		"&&",
		"aptos move run",
		f"--function-id { estate_1_legacy_address }::Pergola_Taffoni::J",
		f"--args amount:{ amount }",
		"--assume-yes"
	]))
	
	
establish ();
