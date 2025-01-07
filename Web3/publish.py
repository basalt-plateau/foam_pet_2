

''''


"'''

import os

ride = "F5565CC1D71781D6EF766A2A50ED459B9D3B430CEB6F7BBF79393C3626A979CD"



to_publish = []



os.system (f"cd /Metro/Web3/Rides/Rules && aptos move publish --assume-yes --named-addresses ride={ ride }");


