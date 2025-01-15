

'''
	import scout
	scout.leap ()
'''


def leap (packet):
	#module_name, function_name, args):

	URL = packet ["URL"]

	address = packet ["address"]
	module_name = packet ["module_name"]
	function_name = packet ["function_name"]
	
	args = packet ["args"]
	type_arguments = packet ["type_arguments"]
	
	"""Call a function in a Move module on the Aptos testnet."""
	url = f"{ URL }/view"
	
	url = "https://api.testnet.aptoslabs.com/v1/view"
	
	data = {
		"function": f"{ address }::{module_name}::{function_name}",
		"type_arguments": type_arguments,
		"arguments": args
	}
	headers = {"Content-Type": "application/json"}

	print ("data:", data)

	#response = requests.post (url, json = data)
	response = requests.post (url, json = data, headers = headers)

	if response.status_code == 200:
		return response.json ()
	
	
	print (f"Error calling function: { response.status_code } - { response.text }")
	return None