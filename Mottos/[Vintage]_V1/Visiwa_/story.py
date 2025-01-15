



#\
#
import pathlib
from os.path import dirname, join, normpath
import sys
def add_paths_to_system (paths):
	this_directory = pathlib.Path (__file__).parent.resolve ()	
	for path in paths:
		sys.path.insert (0, normpath (join (this_directory, path)))
	

add_paths_to_system ([
	'trucks'
])
#
#/




''''
	
	@ story 1
	
"'''
from os.path import dirname, join, normpath
import sys
import pathlib
import os

this_directory = pathlib.Path (__file__).parent.resolve ()	
CWD = str (normpath (join (this_directory, "Move")))
os.chdir (CWD)

#\
#/


import click
from story_plays import story_plays
from story_views import story_views

''''
	@ ride
		@ soil
"'''


from story_theme import story_theme
theme = story_theme ();
ride = theme ["ride"]
module_name = theme ["module_name"]




screenplay_compile = " ".join ([
	"aptos move compile",
	f'--named-addresses ride={ ride }'
])
screenplay_publish = " ".join ([
	"aptos move publish",
	'--url "https://api.devnet.aptoslabs.com/v1"',
	'--assume-yes',
	f'--named-addresses ride={ ride }'			
])

def clique ():
	@click.group ()
	def group ():
		pass

	@click.command ("compile")
	def command_compile ():	
		screenplays = [
			"rm -rf build",
			screenplay_compile
		]
		for screenplay in screenplays:
			print ("screenplay:", screenplay)
			os.system (screenplay)
	group.add_command (command_compile)

	#
	#
	#	https://aptos.dev/en/build/smart-contracts/error-codes
	#
	#
	@click.command ("publish")
	def publish ():	
		
		screenplays = [
			# "rm -rf .aptos",
			"rm -rf build",
			screenplay_compile,
			screenplay_publish
		]
		for screenplay in screenplays:
			print ("screenplay:", screenplay)
			os.system (screenplay)
	group.add_command (publish)
	
	

	
	group.add_command (story_plays ())
	group.add_command (story_views ())
	
	group ()


clique ()
