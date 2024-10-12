
''''
from vivaciousness.Moves.Aptos_Account_Transfer.TP_Object_Checks.TP_1 import check_TP_Object
check_TP_Object ({
	"petition_bracket": {}
})
"'''

''''
	Differences:
		rawTransaction.expiration_timestamp_secs
		rawTransaction.sequence_number
"'''

def ask_for_expected ():
	#deep_copied_dict = copy.deepcopy (original_dict)

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

import copy
import json
from selenium.webdriver.common.by import By
from deepdiff import DeepDiff

def check_TP_Object (packet):
	petition_bracket = packet ["petition_bracket"]

	

	
	''''
	unsigned_transaction_fiberized = driver.find_element (
		By.CSS_SELECTOR, 
		"[unsigned_transaction_fiberized]"
	)
	petition_bracket = json.loads (unsigned_transaction_fiberized.text)
	"'''
	
	assert ("rawTransaction" in petition_bracket);
	rawTransaction = petition_bracket ["rawTransaction"]
	assert ("expiration_timestamp_secs" in rawTransaction);
	assert ("sequence_number" in rawTransaction);
	
	
	#
	#
	#	This modifies the expectations.
	#
	#
	expected = ask_for_expected ()
	expected ["rawTransaction"] ["expiration_timestamp_secs"] = petition_bracket ["rawTransaction"] ["expiration_timestamp_secs"]
	expected ["rawTransaction"] ["sequence_number"] = petition_bracket ["rawTransaction"] ["sequence_number"]
	
	
	#diff = DeepDiff (expected, unsigned_transaction_object)
	#print ("diff:", diff)
	#assert not diff, f"Dictionaries differ: {diff}"
	