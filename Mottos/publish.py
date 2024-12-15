

''''


"'''

import os

#
#
#	legacy address
#
#
ride = "65BFBEDF54F4D10019DB9207517B5FF73606E16672FF811446EC4D302137D374"

'''
aptos account list --query resources


(cd /Metro/Mottos/Visiwa && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)

(cd /Metro/Mottos/Quarry && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)


(cd /Metro/Mottos/Pergola && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
(cd /Metro/Mottos/Tholvi && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
'''

to_publish = [
	
]


'''
os.system (f"cd /Metro/Mottos/Visiwa && aptos move publish --assume-yes --named-addresses ride={ ride }");
os.system (f"cd /Metro/Mottos/Quarry && aptos move publish --assume-yes --named-addresses ride={ ride }");
os.system (f"cd /Metro/Mottos/Pergola && aptos move publish --assume-yes --named-addresses ride={ ride }");
os.system (f"cd /Metro/Mottos/Tholvi && aptos move publish --assume-yes --named-addresses ride={ ride }");
# os.system (f"cd /Metro/Mottos/Rondovals/Rondoval && aptos move publish --assume-yes --named-addresses ride={ ride }");
'''

os.system (f"cd /Metro/Mottos/Merci && aptos move publish --assume-yes --named-addresses ride_1={ ride }");
