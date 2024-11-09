

import os

estate_1_legacy_address = "9b30243a0cc51b6a59a0fbc2220adcb0601bf9627eb35400d5760a1292b4184d"


def ask_for_microseconds ():
	os.system (" ".join ([
		"cd /Metro/Mottos/Rondovals/Rondoval",
		"&&",
		"aptos move view",
		f"--function-id { estate_1_legacy_address }::Tholvi_Earth::ask_for_microseconds",
		"--assume-yes"
	]))


ask_for_microseconds ();