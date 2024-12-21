

''''
	This doesn't work yet.
"'''

import os


version = "v8_0_0_0"

assets_path = "/Metro/vehicles_cx_freeze/assets"
distribution_path = f"/Metro/vehicles_cx_freeze/_distributions/{ version }/Foam_Pet.linux-x86_64.{ version }"
rules_distribution_path = f"{ distribution_path }.Rules"

def mimic (packet):
	origin = packet ["origin"]
	to = packet ["to"]
	os.system (f"cp '{ origin }' '{ to }'")

def mimic_recursively (packet):
	origin = packet ["origin"]
	to = packet ["to"]
	os.system (f"cp -R '{ origin }' '{ to }'")



os.system ('apt install zip -y')

os.system (f"mkdir /Metro/vehicles_cx_freeze/_distributions/{ version }");


#
#
#	Add Assets to the distribution
#
#
mimic ({
	"origin": f"{ assets_path }/Rules.E.HTML",
	"to": f"{ distribution_path }/Rules.{ version }.HTML"
})
mimic ({
	"origin": f"{ assets_path }/Leaflet.E.HTML",
	"to": f"{ distribution_path }/Leaflet.HTML"
})


#
#
#	Prep the rules
#
#
os.system (f"mkdir { rules_distribution_path }")
mimic_recursively ({
	"origin": f"/Metro/vehicles_cx_freeze/_distributions/{ version }/Foam_Pet.linux-x86_64.{ version }/lib/foam_pet/Rules",
	"to": f"/Metro/vehicles_cx_freeze/_distributions/{ version }/Foam_Pet.linux-x86_64.{ version }.Rules/Rules_PyPI_foam_pet"
})
mimic ({
	"origin": "/Metro/vehicles_cx_freeze/assets/Rules.E.HTML",
	"to": f"/Metro/vehicles_cx_freeze/_distributions/{ version }/Foam_Pet.linux-x86_64.{ version }.Rules/Rules.E.HTML"
})
mimic ({
	"origin": "/Metro/vehicles_cx_freeze/_distributions/{ version }/Foam_Pet.linux-x86_64.{ version }/frozen_application_license.txt",
	"to": f"/Metro/vehicles_cx_freeze/_distributions/{ version }/Foam_Pet.linux-x86_64.{ version }.Rules/frozen_application_license.txt"
})




#
#
#	zip
#
#
print ("zipping");
os.system (f"chmod -R 777 /Metro")
os.system (f'(cd _distributions/{ version } && zip -r "Foam_Pet.linux-x86_64.{ version }.zip" "Foam_Pet.linux-x86_64.{ version }")');
os.system (f'(cd _distributions/{ version } && zip -r "Foam_Pet.linux-x86_64.{ version }.Rules.zip" "Foam_Pet.linux-x86_64.{ version }.Rules")');
os.system (f"chmod -R 777 /Metro")
print ("done zipping");


print (f"""

This is a Foam Pet that can live in a Linux OS that use a x86-64 Processor.

[Save Rules to OS](https://github.com/basalt-plateau/foam_pet/releases/download/publication_{ version }/Foam_Pet.linux-x86_64.{ version }.Rules.zip)
[Adopt (Save to OS)](https://github.com/basalt-plateau/foam_pet/releases/download/publication_{ version }/Foam_Pet.linux-x86_64.{ version }.zip)

Opening:
Open a terminal and run:

./Foam_Pet_{ version }.linux-x86_64/clap

After that, the Foam Pet should be here:
http://localhost:2300/

""")