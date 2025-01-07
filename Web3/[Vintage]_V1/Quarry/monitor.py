



import os


estate_1_legacy_address = "ca5b9eff57b3f39e1e2cc3852a01d51091572af44ae37929cdad8d26a6b2c6cf"






os.system (" ".join ([
	"cd /Metro/Mottos/Quarry",
	"&&",
	"aptos move test",
	f"--named-addresses 'ride={ estate_1_legacy_address }'",
	
	# "--filter create_string_from_u8_1"
]))