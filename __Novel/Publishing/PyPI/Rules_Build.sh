


#
#	Rules: 
#
#		more info: vehicles/foam_pet/features/tenets
#
rm -rf /Metro/.pnpm-store

(cd /Metro/vehicles_frontend/sveltenetics && pnpm run build_frontend)

(cd /Metro/vehicles_frontend/sveltenetics && pnpm run build_rules)

pip install pip-licenses
pip-licenses --with-license-file --format=json > /Metro/vehicles/foam_pet/Rules/Laboratory/PyPI_rules_entire.json
pip-licenses > /Metro/vehicles/foam_pet/Rules/Laboratory/PyPI_rules_legend.txt

mkdir /Metro/vehicles_frontend/sveltenetics/static/Rules 
cp -Rv /Metro/vehicles/foam_pet/Rules/* /Metro/vehicles_frontend/sveltenetics/static/Rules/

(cd /Metro/vehicles_frontend/sveltenetics && pnpm run build_frontend)

