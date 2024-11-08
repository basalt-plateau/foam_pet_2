



import os


estate_1_legacy_address = "5E7ACF0A1945FFF9E94D771A790C2A230B646F29288DBE31E8DC5182750E27C2"
estate_2_legacy_address = "E7547E236BEAC4094BBA177F8D28F4420A48CFDE0C13540C024A179BBFB0F203"


Rondoval = " ".join ([
	"cd /Metro/Mottos/Rondovals/Rondoval",
	"&&",
	"aptos move test",
	f"--named-addresses 'ride={ estate_1_legacy_address }'"
])

Rondoval_Thermoplastic = " ".join ([
	"cd /Metro/Mottos/Rondovals/Rondoval_Thermoplastic",
	"&&",
	"aptos move test",
	f"--named-addresses 'ride={ estate_1_legacy_address }'"
])

Rondoval_Geimfara = " ".join ([
	"cd /Metro/Mottos/Rondovals/Rondoval_Geimfara",
	"&&",
	"aptos move test",
	f"--named-addresses 'ride={ estate_1_legacy_address }, ride_2={ estate_1_legacy_address }'"
])

Rondoval_Tivaevae = " ".join ([
	"cd /Metro/Mottos/Rondovals/Rondoval_Tivaevae",
	"&&",
	"aptos move test",
	f"--named-addresses 'ride={ estate_1_legacy_address }, ride_2={ estate_2_legacy_address }'"
])

#os.system (Rondoval)
#os.system (Rondoval_Thermoplastic)
#os.system (Rondoval_Geimfara)
os.system (Rondoval_Tivaevae)

