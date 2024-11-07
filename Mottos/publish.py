

import os

#
#
#	legacy address
#
#
ride = "CA5B9EFF57B3F39E1E2CC3852A01D51091572AF44AE37929CDAD8D26A6B2C6CF"

'''
aptos account list --query resources


(cd /Metro/Mottos/Visiwa && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)

(cd /Metro/Mottos/Quarry && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)


(cd /Metro/Mottos/Pergola && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
(cd /Metro/Mottos/Tholvi && aptos move test --named-addresses ride=99CABA6E28919A1EF5ADA895A9E0B1093159F823C523EAF5EDDF5CFDC3293E2F)
'''

os.system (f"cd /Metro/Mottos/Visiwa && aptos move publish --assume-yes --named-addresses ride={ ride }");

os.system (f"cd /Metro/Mottos/Quarry && aptos move publish --assume-yes --named-addresses ride={ ride }");

os.system (f"cd /Metro/Mottos/Pergola && aptos move publish --assume-yes --named-addresses ride={ ride }");
os.system (f"cd /Metro/Mottos/Tholvi && aptos move publish --assume-yes --named-addresses ride={ ride }");

# os.system (f"cd /Metro/Mottos/Bothy && aptos move publish --assume-yes --named-addresses ride={ ride }");
