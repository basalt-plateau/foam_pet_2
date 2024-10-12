


''''
	Differences:
		rawTransaction.expiration_timestamp_secs
		rawTransaction.sequence_number
"'''

def ask_for_expected ():
	return {
		"rawTransaction": {
			"sender": {
				"data": "522D906C609A3D23B90F072AD0DC74BF857FB002E211B852CE38AD6761D4C8FD"
			},
			"sequence_number": "1",
			"payload": {
				"entryFunction": {
					"module_name": {
						"address": {
							"data": "0000000000000000000000000000000000000000000000000000000000000001"
						},
						"name": {
							"identifier": "aptos_account"
						}
					},
					"function_name": {
						"identifier": "transfer"
					},
					"type_args": [],
					"args": [
						{
							"value": {
								"value": "26F4F8D7C5526BA7DA453041D3A858CFEA06D911C90C2E40EDA2A7261826858C"
							}
						},
						{
							"value": {
								"value": "00E1F50500000000"
							}
						}
					]
				}
			},
			"max_gas_amount": "200000",
			"gas_unit_price": "100",
			"expiration_timestamp_secs": "1723684239",
			"chain_id": {
				"chainId": 146
			}
		}
	}


import json
from selenium.webdriver.common.by import By
from deepdiff import DeepDiff

def check_TP_Object (driver):
	expected = ask_for_expected ()
	
	unsigned_transaction_fiberized = driver.find_element (
		By.CSS_SELECTOR, 
		"[unsigned_transaction_fiberized]"
	)
	
	unsigned_transaction_object = json.loads (unsigned_transaction_fiberized.text)
	assert ("rawTransaction" in unsigned_transaction_object);
	assert ("expiration_timestamp_secs" in unsigned_transaction_object ["rawTransaction"]);
	assert ("sequence_number" in unsigned_transaction_object ["rawTransaction"]);
	
	expected ["rawTransaction"] ["expiration_timestamp_secs"] = unsigned_transaction_object ["rawTransaction"] ["expiration_timestamp_secs"]
	expected ["rawTransaction"] ["sequence_number"] = unsigned_transaction_object ["rawTransaction"] ["sequence_number"]
	
	#diff = DeepDiff (expected, unsigned_transaction_object)
	#print ("diff:", diff)
	#assert not diff, f"Dictionaries differ: {diff}"
	