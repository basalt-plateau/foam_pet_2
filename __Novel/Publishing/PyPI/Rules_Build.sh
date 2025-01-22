

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


#
#	Rules: 
#
#		more info: vehicles/foam_pet/features/tenets
#
rm -rf /Metro/.pnpm-store


#
#
#	Frontend Licenses
#
#
(cd /Metro/vehicles_frontend/sveltenetics && pnpm run build_frontend)
(cd /Metro/vehicles_frontend/sveltenetics && pnpm run build_rules)


#
#
#	Backend Licenses
#
#
pip-licenses --with-license-file --format=json > /Metro/vehicles/foam_pet/Rules/Laboratory/PyPI_rules_entire.json
pip-licenses > /Metro/vehicles/foam_pet/Rules/Laboratory/PyPI_rules_legend.txt

mkdir /Metro/vehicles_frontend/sveltenetics/static/Rules 
cp -Rv /Metro/vehicles/foam_pet/Rules/* /Metro/vehicles_frontend/sveltenetics/static/Rules/


#
#
#	Frontend needs to be build again because...
#
#
(cd /Metro/vehicles_frontend/sveltenetics && pnpm run build_frontend)

