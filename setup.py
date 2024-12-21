
''''
	python setup.py build
"'''

from cx_Freeze import setup, Executable

'''
# Dependencies are automatically detected, but they might need fine-tuning.
build_exe_options = {
    "excludes": ["tkinter", "unittest"],
    "zip_include_packages": ["encodings", "PySide6", "shiboken6"],
}
'''

# .py_3_11

version = "v8_0_0_0"


#
#
#	OS: Linux
#
#
name = f"Foam_Pet.linux-x86_64.{ version }"

#base = "Win32GUI"
base = "gui"

setup(
    name = "foam_pet_cx",
    version = "0.1",
    description = "",
    options = {
		"build_exe": {
			"build_exe": f"vehicles_cx_freeze/_distributions/{ version }/{ name }",
			"include_path": [
				"vehicles"
			],
			"excludes": [],
			"zip_include_packages": [ ],
		}
	},
    executables = [
		Executable (
			"vehicles/foam_pet/foam_pet.py", 
			base = base
		),
		Executable (
			"vehicles/foam_pet/clap.py", 
			base = base
		)
	],
)