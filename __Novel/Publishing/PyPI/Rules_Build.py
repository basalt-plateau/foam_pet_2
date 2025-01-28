

''''
	python3 /Metro/__Novel/Publishing/PyPI/Rules_Build.py
"'''


''''
	Description:
		Frontend:
			* delete /Metro/.pnpm-store
			
			* Builds the rules inside the Python3 module:
				* full licenses to:
					$Rules_Path/Laboratory/frontend_rules_entire.txt
					
				* license legend to:
					$Rules_Path/Laboratory/frontend_rules_legend.txt
				
		Python3:
			
"'''

''''
	Asks:
		Frontend: $Rules_Path/Frontend/
		Backend:  $Rules_Path/Python3/
"'''

import os
import subprocess


#--
#
Rules_Path = "/Metro/vehicles/Mech_Pet/Rules"
Rules_Path_FE = "/Metro/vehicles/Mech_Pet/Rules/Frontend"
FE_Path = "/Metro/vehicles_frontend/sveltenetics"
#
#
Le_env = os.environ.copy ()
Le_env ["Rules_Path_FE"] = Rules_Path_FE;
#
#--



def proc (screenplay):
	result = subprocess.run(
		screenplay, 
		cwd = FE_Path,
		env = Le_env
	)
	assert (result.returncode == 0);
	print ("played:", screenplay);

#os.system ("rm -rf /Metro/.pnpm-store");

#proc (["pnpm", "run", "build_frontend"])
#proc (["pnpm", "run", "rules_build"])

#os.system (f"pip-licenses --with-license-file --format=json > '{ Rules_Path }/Python3/PyPI_rules_entire.json'")
#os.system (f"pip-licenses > '{ Rules_Path }/Python3/PyPI_rules_legend.txt'")

#
#	clone the rules
#
#
os.system (f"rm -rf '{ Rules_Path }/'*");
os.system (f"cp -Rv '{ Rules_Path }/'* '{ FE_Path }/static/Rules/'");