
def add_paths_to_system (paths):
	import pathlib
	from os.path import dirname, join, normpath
	import sys
	
	this_directory = pathlib.Path (__file__).parent.resolve ()	
	for path in paths:
		sys.path.insert (0, normpath (join (this_directory, path)))

add_paths_to_system ([
	'modules_pip'
])

import toml

try:
	with open ("/poetry_mix/pyproject.toml", "r") as f:
		toml.load(f)
	print ("Validation successful: pyproject.toml is syntactically valid.")
	
except toml.TomlDecodeError as e:
	print (f"Validation failed: {e}")