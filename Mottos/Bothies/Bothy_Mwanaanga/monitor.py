





import os


estate_1_legacy_address = "5E7ACF0A1945FFF9E94D771A790C2A230B646F29288DBE31E8DC5182750E27C2"
estate_2_legacy_address = "E7547E236BEAC4094BBA177F8D28F4420A48CFDE0C13540C024A179BBFB0F203"



'''
aptos account list --query resources


(cd /Metro/Mottos/Visiwa && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)

(cd /Metro/Mottos/Quarry && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)


(cd /Metro/Mottos/Pergola && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
(cd /Metro/Mottos/Tholvi && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
'''




os.system (" ".join ([
	"cd /Metro/Mottos/Bothies/Bothy_Mwanaanga",
	"&&",
	"aptos move test",
	f"--named-addresses 'ride={ estate_1_legacy_address }, ride_2={ estate_2_legacy_address }'"
]))