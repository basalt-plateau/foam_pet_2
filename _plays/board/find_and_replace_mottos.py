

#
# 	python3 /Metro/_plays/board/find_and_replace_mottos.py
#
#	atopodentatus, tholin, hemoglycin
#

def add_paths_to_system (paths):
	import pathlib
	from os.path import dirname, join, normpath
	import sys
	
	this_directory = pathlib.Path (__file__).parent.resolve ()	
	for path in paths:
		sys.path.insert (0, normpath (join (this_directory, path)))

add_paths_to_system ([
	'../stages_pip'
])


import ships.paths.directory.find_and_replace_string_v2 as find_and_replace_string_v2
import pathlib
from os.path import dirname, join, normpath

this_directory = pathlib.Path (__file__).parent.resolve ()
habitat_path = "/Metro"

places = [
	str (normpath (join (habitat_path, "Mottos"))),
]

for place in places:
	print ("place:", place)

	find_and_replace_string_v2.start (
		the_path = place,

		find = 'mtembezi',
		replace_with = 'geimfara',
		
		replace_contents = "yes",
		replace_paths = "yes"
	)