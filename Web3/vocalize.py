







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

import Rides.Rules as Rules_Moves
import Rides.Peptyde as Peptyde_Moves

ride_plate = "F5565CC1D71781D6EF766A2A50ED459B9D3B430CEB6F7BBF79393C3626A979CD"

moves_structures = {
	"Rules": {
		"moves": Rules_Moves,
		"envelope": {
			"ride_plate": ride_plate,
			"location": "/Metro/Web3/Rides/Rules"
		}
	},
	"Peptyde": {
		"moves": Peptyde_Moves,
		"envelope": {
			"ride_plate": ride_plate,
			"location": "/Metro/Web3/Rides/Peptyde"
		}
	}
}

moves = [
	#"Rules",
	"Peptyde"
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
			continue;

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



