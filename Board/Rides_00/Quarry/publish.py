

import os

#
#
#	legacy address
#
#
ride = "0f77ed769edda3660495078937d366dc9a133837a816718d6058276f723c8fa8"


os.system (f"cd /Metro/Mottos/Quarry && aptos move publish --assume-yes --named-addresses ride={ ride }");
