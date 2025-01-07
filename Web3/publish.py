

''''


"'''

import os

#
#
#	legacy address
#
#
ride = "F5565CC1D71781D6EF766A2A50ED459B9D3B430CEB6F7BBF79393C3626A979CD"

'''
aptos account list --query resources


(cd /Metro/Mottos/Visiwa && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)

'''

to_publish = [
	
]



os.system (f"cd /Metro/Web3/Rides/Rules && aptos move publish --assume-yes --named-addresses ride={ ride }");


# os.system (f"cd /Metro/Mottos/Quarry && aptos move publish --assume-yes --named-addresses ride={ ride }");
# os.system (f"cd /Metro/Mottos/Pergola && aptos move publish --assume-yes --named-addresses ride={ ride }");
# os.system (f"cd /Metro/Mottos/Tholvi && aptos move publish --assume-yes --named-addresses ride={ ride }");
# os.system (f"cd /Metro/Mottos/Rondovals/Rondoval && aptos move publish --assume-yes --named-addresses ride={ ride }");
# os.system (f"cd /Metro/Mottos/Merci && aptos move publish --assume-yes --named-addresses ride_1={ ride }");
