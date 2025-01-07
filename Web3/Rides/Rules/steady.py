


import os

ride_plate = "F5565CC1D71781D6EF766A2A50ED459B9D3B430CEB6F7BBF79393C3626A979CD"
location = "/Metro/Web3/Rides/Rules"


os.system (" ".join ([
	f"cd { location }",
	"&&",
	"aptos move test",
	f"--named-addresses 'ride={ ride_plate }'"
]))