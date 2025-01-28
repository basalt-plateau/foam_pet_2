

#
#
#	build locations:
#		frontend:
#
#
#		backend:
#			/Metro/vehicles/foam_pet/Rules/Laboratory/PyPI_rules_entire.json
#			/Metro/vehicles/foam_pet/Rules/Laboratory/PyPI_rules_legend.txt
#


export Rules_Path="/Metro/vehicles/Mech_Pet/Rules"


#
#	Rules: 
#
#		more info: vehicles/Mech_Pet/features/tenets
#
rm -rf /Metro/.pnpm-store


#
#
#	Frontend Licenses
#
#
(cd /Metro/vehicles_frontend/sveltenetics && pnpm run build_frontend)
(cd /Metro/vehicles_frontend/sveltenetics && pnpm run rules_build)

#
#
#	Backend Licenses
#
#
pip-licenses --with-license-file --format=json > /Metro/vehicles/Mech_Pet/Rules/Laboratory/PyPI_rules_entire.json
pip-licenses > /Metro/vehicles/Mech_Pet/Rules/Laboratory/PyPI_rules_legend.txt

cp -Rv /Metro/vehicles/Mech_Pet/Rules/* /Metro/vehicles_frontend/sveltenetics/static/Rules/


#
#
#	Frontend needs to be build again because...
#
#
(cd /Metro/vehicles_frontend/sveltenetics && pnpm run build_frontend)

