









import os
import click

from story_theme import story_theme
theme = story_theme ();
ride = theme ["ride"]
module_name = theme ["module_name"]

from packets import build_type_args
from packets import build_args






def story_views ():
	@click.group ("views")
	def group ():
		pass



		
	#
	#
	#	aptos move activity_create
	#
	#
	@group.command ("ask_address_landfill_size")
	def activity_create ():	
		address = ride
	
		screenplay = " ".join ([
			"aptos move view",
			'--assume-yes',
			f"--function-id { ride }::{ module_name }::ask_address_landfill_size",
			build_args ([
				f"address:{ address }"
			])
		])
		
		print ("screenplay:", screenplay)
		os.system (screenplay)
		

		

	return group