



import os
import pathlib
from os.path import dirname, join, normpath
import sys
	
this_directory = pathlib.Path (__file__).parent.resolve ()	




def retrieve_named_addresses ():
	Account = {
		"1": {
			"Private Key": "9687BC1623C8796BC2D1F8E9CBA97043717A69CB7869CADBF8E9DABCBF8E9446",
			"Legacy Address": "8E0F71D98112EA5DCDAF6BBAB057BBBB9D7132D1AC2F13215D95ED1D15ECAF13",
			"Address": "989EF5F32A0B5C62ADFCECBCB125AE97DE669FE0B1D2585DC5C7A5D641C77948"
		}
	}

	'''
		Petra 		= "F5565CC1D71781D6EF766A2A50ED459B9D3B430CEB6F7BBF79393C3626A979CD"
		Pannier_03 	= "8E0F71D98112EA5DCDAF6BBAB057BBBB9D7132D1AC2F13215D95ED1D15ECAF13"
	'''

	Build_Site_Address = Account ["1"] ["Address"]
	Ruler_Address = Account ["1"] ["Address"]

	named_addresses = ", ".join ([
		f"""Ruler_01={ Ruler_Address }""",
		f"""Builder_01={ Build_Site_Address }"""
	]);

	
	return "--named-addresses '" + named_addresses + "'";




def steady ():
	named_addresses = retrieve_named_addresses ();
	
	filter = ""
	filter = "--filter Texts_Preferential"
	
	screenplay = " ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move test",
		"--ignore-compile-warnings",
		filter,
		named_addresses
	]);
	
	print ("screenplay:", screenplay);
	
	os.system (screenplay);
	os.system (f"cd '{ this_directory }' && chmod -R 777 .")
	
	
def publish (envelope):
	named_addresses = retrieve_named_addresses ();

	screenplay = " ".join ([
		f"cd { this_directory }",
		"&&",
		"aptos move publish",
		named_addresses
	]);
	
	print ("screenplay:", screenplay);

	os.system (screenplay);
	
def movie (plays):
	for play in plays:
		print (f"play: '{ play }'")
		os.system (play)	
	
def begin ():
	movie ([
		f"aptos move run --function-id { Build_Address }::Module_Ruler_Hulls::Begin --assume-yes",
		f"aptos move view --function-id { Build_Address }::Module_Guest_Hulls::Status"
	]);
	

def open_account (private_key):
	movie ([
		f"(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key { private_key })",
		"aptos account fund-with-faucet --amount 200000000"
	]);
	
	
steady ();