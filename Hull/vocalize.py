







#/
#
import importlib
import os
from os.path import dirname, join, normpath
import sys
import pathlib
from pathlib import Path
#
#
import click
#
#\


#
#
import Rides_Published_Mainnet.Rules as Rules_Moves
import Rides_Published_Mainnet.Rules_10 as Rules_10
#
#
import Rides_Published_Mainnet.Allowed_Wallets_02 as Allowed_Wallets_02
#
#
import Rides_02.Textboard as Textboard
#
#
import Rides.APT_Octas_Math_01 as APT_Octas_Math_01

import Rides.APT_Asks_01 as APT_Asks_01
import Rides.Motions_01 as Motions_01_Moves

import Rides.Peptyde as Peptyde_Moves
import Rides.Rhythm_01 as Rhythm_01

import Rides.Sport_Pack_01 as Sport_Pack_01

''''
	Publisher is the account that is loggen in @ .aptos/config.yaml
	
	Pannier_01:
		Private Key: 	0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C
		Legacy Address: 2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD
"'''
Builder_Addresses = {
	"Petra": "F5565CC1D71781D6EF766A2A50ED459B9D3B430CEB6F7BBF79393C3626A979CD",
	"Pannier_01": "2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD"
}


def motion_for_named_addresses (packet):
	publisher_address = packet ["publisher_address"]
	
	
	#
	#
	#	Publisher
	#
	#
	Builder_01 = {
		"address": publisher_address
	}
	
	#
	#	Producer (Owner, etc.)
	#		This is so that a producer address doesn't need to be passed
	#		to each invokation.
	#
	#		For example:
	#			* Build with Petra
	#			* Produce with Pannier
	#
	Producer_01 = {
		"address": publisher_address
	}
	
	named_addresses = "".join ([
		f"""--named-addresses '""",

		f"""Producer_000001={ Producer_01 ["address"] }, """,
		f"""Producer_01={ Producer_01 ["address"] }, """,
		f"""Formulator_1={ Producer_01 ["address"] }, """,
		f"""Boar_Producer_1={ Producer_01 ["address"] }, """,

		f"""Builder_000001={ Builder_01 ["address"] }, """,
		f"""Builder_01={ Builder_01 ["address"] }, """,
		f"""Publisher_01={ Builder_01 ["address"] }, """,
		f"""Ride_01={ Builder_01 ["address"] }, """,
		f"""ride={ Builder_01 ["address"] }, """,		
		f"""builder_1={ Builder_01 ["address"] },""",		
		"'"
	]);
	
	return named_addresses;


moves_structures = {
	"Sport_Pack_01": Sport_Pack_01,
	
	"Allowed_Wallets_02": Allowed_Wallets_02,
	"Textboard": Textboard,
	
	"APT_Octas_Math_01": APT_Octas_Math_01,
	"Rules_10": Rules_10,
	"Motions_01": Motions_01_Moves,
	#"Peptyde": Peptyde_Moves,
	
	"Rhythm_01": Rhythm_01,
	
	"APT_Asks_01": APT_Asks_01
}



def clique ():
	@click.group ()
	def group ():
		pass
	
	
	"""
		python3 vocalize.py vocalize --publish --move Textboard --builder Pannier_01
		python3 vocalize.py vocalize --publish --move Textboard --builder Petra
	"""
	
	"""
		python3 vocalize.py vocalize --steady --move Textboard
	"""
	
	"""
		python3 vocalize.py vocalize --publish --move Rules_10 --builder Pannier_01
		python3 vocalize.py vocalize --publish --move Allowed_Wallets_02 --builder Pannier_01
		python3 vocalize.py vocalize --publish --move Textboard --builder Pannier_01
	"""
	
	"""
		(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key 0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C) 
		aptos account fund-with-faucet --amount 1000000000
		aptos move run --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Producer_Hulls::Begin --assume-yes
		aptos move view --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Hulls::Status
		aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Platform_1 String:Text_1
	"""
	
	"""
		(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key B779524378A5B497896AB4B5A9EA4B7869AB548796AB4B5A694B7796A4B52617) 
		aptos account fund-with-faucet --amount 100000000
		aptos move run --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Producer_Hulls::Begin --assume-yes
		aptos move view --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Hulls::Status
		aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Platform_1 String:Text_1
	"""
	
	"""
		(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key B4079EADBC8F9EACB0712365BC9EADBC8F9EADBC0712365BC9EADBC8F9EADBC8) 
		aptos account fund-with-faucet --amount 1000000000
		aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Platform_1 String:Text_1
		aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Platform_1 String:Text_2
	"""
	
	"""
aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Producer_Hull::Pause --args String:Platform_1
	"""
	@click.command ("vocalize")
	@click.option ('--move', type = str, help = '')
	@click.option ('--publish', is_flag = True, help = '')
	@click.option ('--steady', is_flag = True, help = '')	
	@click.option ('--builder', type = str, help = '')	
	def vocalize (move, publish, steady, builder):
		if (publish):
			#
			#
			#	license plate
			#
			#
			publisher_address = Builder_Addresses [ builder ];
			moves_structures [ move ].publish ({
				"ride_plate": publisher_address,
				"named_addresses": motion_for_named_addresses ({
					"publisher_address": publisher_address
				})
			});
			
			
			
		elif (steady):
			publisher_address = Builder_Addresses [ "Pannier_01" ];
			moves_structures [ move ].steady ({
				"ride_plate": publisher_address,
				"named_addresses": motion_for_named_addresses ({
					"publisher_address": publisher_address
				})
			});
			
			
			
		else:
			print ("");



	group.add_command (vocalize)
	group ()


clique ();



