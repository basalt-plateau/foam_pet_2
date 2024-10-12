#!/bin/bash





apt update
apt install python3 haproxy python3.11-venv rsync -y

####
#
#	Rules
#
#
mkdir /Rules
cp /building/gpl-3.0-standalone.html /Rules/gpl-3.0-standalone.html
#
cp /building/Foam_Pet.Rules.E.HTML /Foam_Pet.Rules.E.HTML
#
####

mkdir /Trinkets
cp -Rv /building/docker-debian /Trinkets/docker-debian





cp /building/embark.sh /embark.sh


#
#
#	Prepare
#
#
mkdir /Metro
cd /Metro
python3 -m venv v_env
. /Metro/v_env/bin/activate

#
#
#	PyPI:
#		pip install pip-licenses
#		[] pip-licenses > PyPI.licenses.txt
#



#
#
#	uv?
#
#
cd /Metro
pip install foam_pet==6.0.0
foam_pet build
foam_pet demux_hap build_unverified_certificates
foam_pet ventures on	






