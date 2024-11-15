

import os

#
#
#	legacy address
#
#
ride = "150755a53b2fd604f5072bdf22c2f1dca1d9d730d1afaf460a3d8c8e16528c5f"

'''
aptos account list --query resources


(cd /Metro/Mottos/Visiwa && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)

(cd /Metro/Mottos/Quarry && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)


(cd /Metro/Mottos/Pergola && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
(cd /Metro/Mottos/Tholvi && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
'''

to_publish = [
	
]


os.system (f"cd /Metro/Mottos/Visiwa && aptos move publish --assume-yes --named-addresses ride={ ride }");
os.system (f"cd /Metro/Mottos/Quarry && aptos move publish --assume-yes --named-addresses ride={ ride }");

os.system (f"cd /Metro/Mottos/Pergola && aptos move publish --assume-yes --named-addresses ride={ ride }");
os.system (f"cd /Metro/Mottos/Tholvi && aptos move publish --assume-yes --named-addresses ride={ ride }");

os.system (f"cd /Metro/Mottos/Rondovals/Rondoval && aptos move publish --assume-yes --named-addresses ride={ ride }");
