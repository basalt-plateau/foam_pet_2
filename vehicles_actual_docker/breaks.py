

''''
	Foam.v1_0_0.1.Docker_image.tar.zip
"'''

#
#
import os
import click
from os.path import dirname, join, normpath
import pathlib
import shutil
import sys
#
#

this_folder = pathlib.Path (__file__).parent.resolve ()


version = "v6_0_0.0"
name = "Foam_Pet"

container_name = "foam_pet"
image_name = "foam_pet"

####
#
#
#
image_name_plus_version = f"{ image_name }:{ version }"

file_name = f"{name}_{ version }.Docker_image.tar"
zip_file_name = f"{ file_name }.zip"

packet = f"Foam_Pet_{ version }"
packet_zip = f"Foam_Pet_{ version }.zip"

tar_file = f"{ packet }/{file_name}"
zip_tar_file = f"packet_zip/{ zip_file_name }"
#
####


''''
	paths = retrieve_paths ({
		"build_directory": "the_build_1"
	})
"'''
def retrieve_paths (theme = {}):
	build_directory = "the_build_1"
	
	return {
		"readme": {
			"origin": str (normpath (join (
				this_folder, 
				f"the_build_readme.md"
			))),
			"destiny": str (normpath (join (
				this_folder, 
				build_directory,
				f"{ packet }/readme.md"
			)))
		},
		
		"rules": {
			"origin": str (normpath (join (
				this_folder, 
				f"building/Foam_Pet.Rules.E.HTML"
			))),
			"destiny": str (normpath (join (
				this_folder, 
				build_directory,
				f"{ packet }/Foam_Pet.Rules.E.HTML"
			)))
		},
		
		"the_build_1": {
			"path": str (normpath (join (
				this_folder, 
				"the_build_1"
			)))
		},
		
		"the_build_2": {
			"path": str (normpath (join (
				this_folder, 
				f"the_build_2"
			))),
		},
		
		"the_build": str (normpath (join (
			this_folder, 
			f"the_build_1"
		))),
		"distribution_directory": str (normpath (join (
			this_folder, 
			f"the_build_1/{ packet }"
		))),
		"image_built": str (normpath (join (
			this_folder, 
			f"the_build_1/{ packet }/{name}_{ version }.Docker_image.tar"
		))),
		
		
		"distribution_zip": str (normpath (join (
			this_folder, 
			f"the_build_1/{ packet_zip }"
		)))
	}



def run (screenplay):
	print ()
	print ("----")
	print ("screenplay:", screenplay)
	print ()
	#input ("Press Enter to go on:")
	os.system (screenplay)
	print ("----")



def check_image ():
	paths = retrieve_paths ();
	
	name = "Foam_Pet_v6_0_0.0"
	image_name = "foam_pet:v6_0_0.0"
	docker_image_name = "Foam_Pet_v6_0_0.0.Docker_image.tar"
	
	#
	#	maybe:
	#		[OS] docker rmi foam_pet:v1.3.0
	#		[OS] docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
	#
	#		[OS] unzip foam_pet_v1.3.0-1.tar.zip
	#		[OS] docker load -i image/Foam_Pet_v1_3_0.0.Docker_image.tar
	#
	shutil.rmtree (paths ["the_build_2"] ["path"])
	shutil.copytree (
		paths ["the_build_1"] ["path"],
		paths ["the_build_2"] ["path"]
	)
	
	
	zip_file_path = paths ["the_build_2"] ["path"] + "/" + name + ".zip"
	build_directory = paths ["the_build_2"] ["path"] + "/" + name;
	docker_image_tar = paths ["the_build_2"] ["path"] + "/" + name + "/" + docker_image_name
	
	#
	#	1. delete the directory "Foam_Pet_v2_0_0.0"
	#	2. unzip zip file
	#	3. docker load the .tar
	#
	shutil.rmtree (build_directory)
	run (f"""cd '{ paths ["the_build_2"] ["path"] }' && unzip '{ zip_file_path }'""");
	run (f"docker rmi { image_name }");
	run (f"docker load -i '{ docker_image_tar }'")
	run (f"docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)")
	run (f'docker run --name foam_pet_1 -td -e HOST_IP=host.docker.internal -p 22000:22000 -p 21000:21000 -p 443:443 -p 80:80 { image_name } /bin/bash -c "bash /embark.sh"')
	
	
	
def make_docker_image ():
	return;

def save_docker_image ():
	paths = retrieve_paths ();

	distribution_zip = paths ['distribution_zip']
	
	run (f"mkdir -p '{ paths ['distribution_directory'] }'")
	
	#
	#	create:
	#		readme.md
	#		rules
	#
	shutil.copy (paths ["readme"] ["origin"], paths ["readme"] ["destiny"])
	shutil.copy (paths ["rules"] ["origin"], paths ["rules"] ["destiny"])
	
	#
	#
	#	
	#
	#
	run (f"docker rmi { image_name_plus_version }");
	
	
	#
	#	
	#
	#
	run (f"docker stop { container_name }");
	
	
	run (f"docker commit { container_name } { image_name_plus_version }")
	
	run (f"docker save -o { paths ['image_built'] } { image_name_plus_version }")
	
	#
	#
	#	cd the_build 
	#	zip Foam_Pet_v2_0_0.0 Foam_Pet_v2_0_0.0.zip
	#
	run (f"(cd '{ paths ['the_build'] }' && zip -r '{ packet_zip }' '{ packet }')")
	
	#
	#
	#	SHA
	#		# [OS] gzip foam_pet_v1.0.0.tar
	#
	# run (f"(cd '{ paths ['distribution_directory'] }' && sha256sum { file_name })")
	
	#
	#	Distribution ZIP
	#
	#	Checksums: 
	#		SHA
	#
	run (f"(cd '{ paths ['the_build'] }' && sha256sum { distribution_zip })")
	
	
	run (f"chmod -R 777 '{ this_folder }'")
	
	#
	#	92344ad7e4e879046f91438739f5f0d82b6ee5e653d05bdc373c46fb68e4e212  Foam_Pet_v2_0_0.0.zip
	#





def clique ():
	@click.group ()
	def group ():
		pass

	
	#\
	#
	@click.command ("make_docker_image")
	def command__make_docker_image ():	
		make_docker_image ();
		
	group.add_command (command__make_docker_image)
	#
	#/
	
	#\
	#
	@click.command ("save_docker_image")
	def command__build ():	
		save_docker_image ();
		
	group.add_command (command__build)
	#
	#/

	#\
	#
	@click.command ("check_image")
	def command__health ():	
		check_image ()

	group.add_command (command__health)
	#
	#/

	
	group ()


clique ();