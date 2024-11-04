



''''
	0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f

"'''



import requests

''''
	
"'''
def scout (packet):
	#module_name, function_name, args):

	URL = packet ["URL"]

	address = packet ["address"]
	module_name = packet ["module_name"]
	function_name = packet ["function_name"]
	
	args = packet ["args"]
	
	"""Call a function in a Move module on the Aptos testnet."""
	url = f"{ URL }/view"
		
	data = {
		"function": f"{ address }::{module_name}::{function_name}",
		"type_arguments": [],
		"arguments": args
	}
	headers = {"Content-Type": "application/json"}

	print ("data:", data)

	#response = requests.post (url, json = data)
	response = requests.post (url, json = data, headers = headers)

	if response.status_code == 200:
		return response.json ()
	else:
		print (f"Error calling function: { response.status_code } - { response.text }")
		return None


def check_1 ():
	URL = "https://api.testnet.aptoslabs.com/v1"
	address = "0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f"

	scouted = scout ({
		"URL": URL,
		
		"address": address,
		"module_name": "Loft",
		"function_name": "togetherness",
		
		"args": [],
		"type_arguments": []
	})
	
	print ("scouted:", scouted)

	return;
	
checks = {
	'check 1': check_1
}