

def fonction_run ():
	import requests

	url = "https://api.mainnet.aptoslabs.com/v1/transactions"

	payload = {
		"sender": "0x88fbd33f54e1126269769780feb24480428179f552e2313fbe571b72e62a1ca1 ",
		"sequence_number": "32425224034",
		"max_gas_amount": "32425224034",
		"gas_unit_price": "32425224034",
		"expiration_timestamp_secs": "32425224034",
		"payload": {},
		"signature": {}
	}
	headers = {"Content-Type": "application/json"}

	response = requests.post (url, json = payload, headers = headers)

	print(response.json())


import os

estate_1_legacy_address = "9b30243a0cc51b6a59a0fbc2220adcb0601bf9627eb35400d5760a1292b4184d"


def establish ():
	os.system (" ".join ([
		"cd /Metro/Mottos/Rondovals/Rondoval",
		"&&",
		"aptos move run",
		f"--function-id { estate_1_legacy_address }::Rondoval_Tivaevae::B",
		"--assume-yes"
	]))

def demolish ():
	os.system (" ".join ([
		"cd /Metro/Mottos/Rondovals/Rondoval",
		"&&",
		"aptos move run",
		f"--function-id { estate_1_legacy_address }::Rondoval_Tivaevae::J",
		f"--args address:{ estate_1_legacy_address }",
		"--assume-yes"
	]))
	
	
establish ();
demolish ();