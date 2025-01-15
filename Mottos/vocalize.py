







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


import Rides.APT_Octas_Math_01 as APT_Octas_Math_01
import Rides.APT_Requests_01 as APT_Requests_01
import Rides.Peptyde as Peptyde_Moves
import Rides.Rhythm_01 as Rhythm_01
import Rides.Rules as Rules_Moves
import Rides.Rules_10 as Rules_10_Moves
import Rides.Tiny_Water_Balloons_1 as Tiny_Water_Balloons_1

ride_plate = "F5565CC1D71781D6EF766A2A50ED459B9D3B430CEB6F7BBF79393C3626A979CD"

moves_structures = {
	"Rules_10": {
		"moves": Rules_10_Moves,
		"envelope": {
			"ride_plate": ride_plate,
			"location": "/Metro/Web3/Rides/Rules_10"
		}
	},
	"Peptyde": {
		"moves": Peptyde_Moves,
		"envelope": {
			"ride_plate": ride_plate,
			"location": "/Metro/Web3/Rides/Peptyde"
		}
	},
	"Tiny_Water_Balloons_1": {
		"moves": Tiny_Water_Balloons_1,
		"envelope": {
			"ride_plate": ride_plate,
			"location": "/Metro/Mottos/Rides/Tiny_Water_Balloons_1"
		}
	},
	"Rhythm_01": {
		"moves": Rhythm_01,
		"envelope": {
			"ride_plate": ride_plate,
			"location": "/Metro/Web3/Rides/Rhythm_01"
		}
	},
	"APT_Octas_Math_01": {
		"moves": APT_Octas_Math_01,
		"envelope": {
			"ride_plate": ride_plate,
			"location": "/Metro/Mottos/Rides/APT_Octas_Math_01"
		}
	}
}

moves = [
	"APT_Octas_Math_01",
	#"Tiny_Water_Balloons_1",
	#"Rhythm_01",
	#"Rules_10"
]


def clique ():
	@click.group ()
	def group ():
		pass


	#
	#
	#	Publish
	#
	#
	@click.command ("publish")
	def vocalize__publish ():	
		CWD = os.getcwd ()
		
		for move in moves:
			moves_structure = moves_structures [ move ];
			moves_structure ["moves"].publish (moves_structure ["envelope"]);

	group.add_command (vocalize__publish)


	
	@click.command ("build")
	def vocalize__publish ():	
		CWD = os.getcwd ()
		
		for move in moves:
			moves_structure = moves_structures [ move ];
			moves_structure ["moves"].build (moves_structure ["envelope"]);

	group.add_command (vocalize__publish)


	#
	#
	#	Steady
	#
	#
	@click.command ("steady")
	def vocalize__steady ():	
		CWD = os.getcwd ();

		for move in moves:
			print ("move", move)
		
			moves_structure = moves_structures [ move ];
			moves_structure ["moves"].steady (moves_structure ["envelope"]);

	group.add_command (vocalize__steady)
	
	group ()


clique ();



