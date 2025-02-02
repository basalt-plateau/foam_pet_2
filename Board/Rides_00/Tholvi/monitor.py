



def monitor_Tholvi ():
	import os

	estate_1_legacy_address = "9B30243A0CC51B6A59A0FBC2220ADCB0601BF9627EB35400D5760A1292B4184D"
	estate_2_legacy_address = "E7547E236BEAC4094BBA177F8D28F4420A48CFDE0C13540C024A179BBFB0F203"

	filter = "--filter Steady_Tholvi_Planet_3_1"

	Tholvi = " ".join ([
		"cd /Metro/Mottos/Tholvi",
		"&&",
		"aptos move test",
		"--ignore-compile-warnings",
		#filter,
		f"--named-addresses 'ride={ estate_1_legacy_address },ride_2={ estate_2_legacy_address }'"
	])
		
	os.system (Tholvi)

if __name__ == "__main__":
	monitor_Tholvi ();
	
	
	
	