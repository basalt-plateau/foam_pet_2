




import os


novelist = {
	"address": "0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd"
}
estate_2 = {
	"private key": "B89ABC50712653C071625BC8F9EADBC8F9EDACB706152CBF89EDABC1625BC261",
	"legacy address": "E7CB1E9B8FA8ADFF1C3720FA9C36A150E8F08B6E864FF5CB102F6ECCF5FE9BA3"
}
estate_3 = {
	"private key": "2105BC9EADBC8F9EADBC1625BC9EADBC8E9DACB8FE9ADBC172365ABC9EADBC8F",
	"legacy address": "8F61659675B8040A55513F441DA2D6F039A2188A49F7ADA69E9C7FBD4A952C7E"
}

filter = ""
filter = ""

def steady (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]
	
	print ("steady");
	
	named_addresses = "".join ([
		f"""--named-addresses '""",
		
		f"""ride={ novelist ["address"] }, """,

		f"""boat_1={ novelist ["address"] }, """,
		f"""boat_2={ estate_2 ["legacy address"] }, """
		f"""boat_3={ estate_3 ["legacy address"] }""",
		"'",
	]);
	
	# f"""--named-addresses 'boat_1={ novelist ["address"] }, boat_2={ estate_2 ["legacy address"] }, boat_3={ estate_3 ["legacy address"] }'"""
	
	os.system (
		" ".join ([
			f"cd { location }",
			"&&",
			"aptos move test",
			"--ignore-compile-warnings",
			filter,
			named_addresses
		])
	);
	
	
	
def publish (envelope):
	ride_plate = envelope ["ride_plate"]
	location = envelope ["location"]

	os.system (" ".join ([
		f"cd { location }",
		"&&",
		"aptos move publish",
		f"--named-addresses 'ride={ ride_plate }'"
	]));
