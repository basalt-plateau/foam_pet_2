


''''

"'''


import os
import click

from story_theme import story_theme
theme = story_theme ();
ride = theme ["ride"]
module_name = theme ["module_name"]

from packets import build_type_args
from packets import build_args



def story_plays ():
	@click.group ("plays")
	def group ():
		pass

	
	#\
	#
	#	plays obtain_emblem
	#
	#
	@group.command ("obtain_emblem")
	def obtain_emblem ():
		''''
			origin_address: &signer, 
			destination_address: address, 
			amount: u64
		"'''

	
		screenplay = " ".join ([
			"aptos move run",
			'--assume-yes',
			f"--function-id { ride }::{ module_name }::obtain_emblem",
			build_args ([])
		])
		
		print ("screenplay:", screenplay)
		os.system (screenplay)
	#
	#/
	
	#\
	#
	#	plays obtain_bunch
	#
	#
	@group.command ("obtain_bunch")
	def obtain_bunch ():
		''''
			origin_address: &signer, 
			destination_address: address, 
			amount: u64
		"'''
		destination_address = "A4C6950B50321A0156A8E443D0610942A3CB71EB4AF73664CBD9797F278E82D7"
		amount = "100000"
	
		screenplay = " ".join ([
			"aptos move run",
			'--assume-yes',
			f"--function-id { ride }::{ module_name }::obtain_bunch",
			build_args ([
				f'address:{ destination_address }',
				f'u64:{ amount }',
			])
		])
		
		print ("screenplay:", screenplay)
		os.system (screenplay)
	#
	#/


	return group