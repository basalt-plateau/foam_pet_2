



import os


estate_1_legacy_address = "99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f"
estate_1_private_key = "0xb7798fb41f238e9dacbe9ef045273496adbc8f9eadbc8f14073e9dacbf8e9cbd"



'''
aptos account list --query resources


(cd /Metro/Mottos/Visiwa && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)

(cd /Metro/Mottos/Quarry && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)


(cd /Metro/Mottos/Pergola && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
(cd /Metro/Mottos/Tholvi && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
'''




os.system (" ".join ([
	"cd /Metro/Mottos/Bothy",
	"&&",
	"aptos move test",
	f"--named-addresses 'ride={ estate_1_legacy_address }, estate_1_legacy_address={ estate_1_legacy_address }'"
]))