



import os


estate_1_legacy_address = "0f77ed769edda3660495078937d366dc9a133837a816718d6058276f723c8fa8"




os.system (" ".join ([
	"cd /Metro/Mottos/Pergola",
	"&&",
	"aptos move test",
	f"--named-addresses 'ride={ estate_1_legacy_address }'",
	
	#"--filter steady_sequence_numerals"
]))