

#
# 	python3 /Metro/_plays/board/find_and_replace.py
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
	str (normpath (join (habitat_path, "Metro.E.HTML"))),
	str (normpath (join (habitat_path, "Metro.Publish.E.HTML"))),
	str (normpath (join (habitat_path, "Metro.Publish.Docker.E.HTML"))),
	str (normpath (join (habitat_path, "Metro.Publish.Vultr.E.HTML"))),
	
	str (normpath (join (habitat_path, "pyproject.toml"))),
	str (normpath (join (habitat_path, "_plays/board/build_1.sh"))),
	str (normpath (join (habitat_path, "_plays/board/build_2.sh"))),
	
	
	str (normpath (join (habitat_path, "estate"))),
	str (normpath (join (habitat_path, "estate_2"))),	
	str (normpath (join (habitat_path, "_health_selenium"))),
	
	str (normpath (join (habitat_path, "vehicles"))),
	str (normpath (join (habitat_path, "vehicles_actual_docker"))),
	str (normpath (join (habitat_path, "vehicles_moves"))),
	str (normpath (join (habitat_path, "vehicles_plumbing")))

	# str (normpath (join (habitat_path, "vehicles_frontend"))),

]

for place in places:
	print ("place:", place)

	find_and_replace_string_v2.start (
		the_path = place,

		find = 'foam_hair',
		replace_with = 'foam_pet',
		
		replace_contents = "yes",
		replace_paths = "yes"
	)