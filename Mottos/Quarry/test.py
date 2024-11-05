



import os


estate_1_legacy_address = "265b37de65ef8e91d5592c32508673ec9c1ede4b40a2e04598d32ba818102b3e"






os.system (" ".join ([
	"cd /Metro/Mottos/Quarry",
	"&&",
	"aptos move test",
	f"--named-addresses 'ride={ estate_1_legacy_address }'"
]))