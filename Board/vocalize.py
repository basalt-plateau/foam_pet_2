







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
import Rides.Motions_01 as Motions_01_Moves
import Rides.Allowed_Wallets as Allowed_Wallets

#
#
import Rides.APT_Octas_Math_01 as APT_Octas_Math_01

import Rides.APT_Asks_01 as APT_Asks_01

import Rides.Peptyde as Peptyde_Moves
import Rides.Rhythm_01 as Rhythm_01

import Rides.Sport_Pack_01 as Sport_Pack_01

''''
	Publisher is the account that is loggen in @ .aptos/config.yaml
"'''

publisher_addresses = {
	"Petra": "F5565CC1D71781D6EF766A2A50ED459B9D3B430CEB6F7BBF79393C3626A979CD",
	"Dev": "2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD"
}

#
#
#	perhaps.. this is the address of the publisher.
#		perhaps.. this should be the same as builder_1.
#
#
ride_plate = publisher_addresses ["Dev"]


def motion_for_named_addresses ():
	owner_1 = {
		"address": ride_plate
	}
	builder_1 = {
		"address": "0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd"
	}
	boar_Team_01 = {
		"private key": "B89ABC50712653C071625BC8F9EADBC8F9EDACB706152CBF89EDABC1625BC261",
		"legacy address": "E7CB1E9B8FA8ADFF1C3720FA9C36A150E8F08B6E864FF5CB102F6ECCF5FE9BA3"
	}
	boar_Team_02 = {
		"private key": "2105BC9EADBC8F9EADBC1625BC9EADBC8E9DACB8FE9ADBC172365ABC9EADBC8F",
		"legacy address": "8F61659675B8040A55513F441DA2D6F039A2188A49F7ADA69E9C7FBD4A952C7E"
	}
	boar_Team_03 = {
		"private key": "0C1218C9ABC123C812359AB7689AB765C89EAB6AD9E8CBE9F8CBE9DABC8F152C",
		"legacy address": "0FDBEA5628A527DF5506EE542D95E11AE8D9B308E0426EF0785F6D009AE663BC"
	}
	boar_Team_04 = {
		"private key": "00E18C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CB49DABC8F152EE",
		"legacy address": "487E4814185F78DE837A663EE7F06304D5FDAF11C3ED95C740BA8D67752BF8C3"
	}
	boar_Team_05 = {
		"private key": "10E18C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CB49DABC8F152EE",
		"legacy address": "07F17CA7B3AF88D51AF23CB5B84BDB7AEE3208722B899F625E2D5FAD1A704A3C"
	}
	boar_Team_06 = {
		"private key": "20E18C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CB49DABC8F152EE",
		"legacy address": "C84CA19FECD44ACFFE1248A64A5C2D4EBF82D03A8F22FAF303B212327BFEF38C"
	}
	boar_Team_07 = {
		"private key": "30E18C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CB49DABC8F152EE",
		"legacy address": "C84CA19FECD44ACFFE1248A64A5C2D4EBF82D03A8F22FAF303B212327BFEF38C"
	}
	boar_Team_08 = {
		"private key": "40E18C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CB49DABC8F152EE",
		"legacy address": "C0ABED0AA780375C0BC474CB9BA368E7A3B3D32AA160C50906FE63899E68D5E3"
	}
	boar_Team_09 = {
		"private key": "50E18C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CB49DABC8F152EE",
		"legacy address": "0E493F6459130C6E8A79C445559E3F874FDD218132FFD242665AEB75442F8EF0"
	}
	boar_Team_10 = {
		"private key": "60E18C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CB49DABC8F152EE",
		"legacy address": "483B6893D7F0ABC322881A000AF51C31FDFCA688DDE70108DFB76F1AFE08CD60"
	}
	
	named_addresses = "".join ([
		f"""--named-addresses '""",

		f"""Formulator_1={ owner_1 ["address"] }, """,
		f"""Boar_Producer_1={ owner_1 ["address"] }, """,

		f"""Ride_01={ builder_1 ["address"] }, """,
		f"""ride={ builder_1 ["address"] }, """,		
		f"""builder_1={ builder_1 ["address"] },""",		
		f"""Builder_01={ builder_1 ["address"] }, """,

		f"""boar_Team_01={ boar_Team_01 ["legacy address"] }, """,
		f"""boar_Team_02={ boar_Team_02 ["legacy address"] }, """,
		f"""boar_Team_03={ boar_Team_03 ["legacy address"] }, """,
		f"""boar_Team_04={ boar_Team_04 ["legacy address"] }, """,
		f"""boar_Team_05={ boar_Team_05 ["legacy address"] }, """,
		f"""boar_Team_06={ boar_Team_06 ["legacy address"] }, """,
		f"""boar_Team_07={ boar_Team_07 ["legacy address"] }, """,
		f"""boar_Team_08={ boar_Team_08 ["legacy address"] }, """,
		f"""boar_Team_09={ boar_Team_09 ["legacy address"] }, """,
		f"""boar_Team_10={ boar_Team_10 ["legacy address"] } """,

				
		
		"'"
	]);
	
	return named_addresses;


moves_structures = {
	"Sport_Pack_01": Sport_Pack_01,
	
	"Allowed_Wallets": Allowed_Wallets,
	
	
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
		python3 vocalize.py vocalize --steady --move Allowed_Wallets
		
		python3 vocalize.py vocalize --publish --move Rules_10
		python3 vocalize.py vocalize --publish --move Sport_Pack_01
	"""
	@click.command ("vocalize")
	@click.option ('--move', type = str, help = '')
	@click.option ('--publish', is_flag = True, help = '')
	@click.option ('--steady', is_flag = True, help = '')	
	def vocalize (move, publish, steady):
		if (publish):
			moves_structures [ move ].publish ({
				"ride_plate": ride_plate,
				"named_addresses": motion_for_named_addresses ()
			});
			
		elif (steady):
			moves_structures [ move ].steady ({
				"ride_plate": ride_plate,
				"named_addresses": motion_for_named_addresses ()
			});
			
		else:
			print ("");



	group.add_command (vocalize)
	group ()


clique ();



