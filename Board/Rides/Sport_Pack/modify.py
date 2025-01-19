


import ships.paths.directory.find_and_replace_string_v2 as find_and_replace_string_v2
import pathlib
from os.path import dirname, join, normpath

this_directory = pathlib.Path (__file__).parent.resolve ()

places = [
	str (normpath (join (this_directory, "sources"))),
	str (normpath (join (this_directory, "test"))),
	str (normpath (join (this_directory, "test")))
]

find_and_replace = [
	[ "Game", "Verse_Freight_Group" ],
	[ "game", "le_Verse_Freight_Group" ]
]


for place in places:
	print ("place:", place)

	for le_replace in find_and_replace:
		find_and_replace_string_v2.start (
			the_path = place,

			find = le_replace [0],
			replace_with = le_replace [1],
			
			replace_contents = "yes",
			replace_paths = "yes"
		)