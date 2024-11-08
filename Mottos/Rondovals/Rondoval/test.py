



import os


estate_1_legacy_address = "265b37de65ef8e91d5592c32508673ec9c1ede4b40a2e04598d32ba818102b3e"



'''
aptos account list --query resources


(cd /Metro/Mottos/Visiwa && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)

(cd /Metro/Mottos/Quarry && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)


(cd /Metro/Mottos/Pergola && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
(cd /Metro/Mottos/Tholvi && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
'''




os.system (" ".join ([
	"cd /Metro/Mottos/Rondoval",
	"&&",
	"aptos move test",
	f"--named-addresses 'ride={ estate_1_legacy_address }, estate_1_legacy_address={ estate_1_legacy_address }'"
]))