

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


''''
	container: Mech_Pet_jetboat

	image: Mech_Pet

	/the_build_1
		/Foam_Pet.Docker.v7_0_0_0.zip
		/Foam_Pet.Docker.v7_0_0_0
			/Foam_Pet.Docker_image.v7_0_0_0.tar
			/Foam_Pet.Docker_image_rules.v7_0_0_0.E.HTML
			/readme.md
	
	/the_build_2
		/Foam_Pet.Docker.v7_0_0_0.zip
		
		
		/Foam_Pet.Docker.v7_0_0_0
			/Foam_Pet.Docker_image.v7_0_0_0.tar
			/Foam_Pet.Docker_image_rules.v7_0_0_0.E.HTML
			/readme.md
"'''

container_name = "Mech_Pet_jetboat"
image_name = "Mech_Pet"

version = "v7_0_0_0"
name = "Foam_Pet"



####
#
#
#
image_name_plus_version = f"{ image_name }:{ version }"
#
#	Le "packet" is the directory that
#	needs to be zipped.	
#
#		packet_zip is the zip_file_name
#
packet = f"{name}.Docker.{ version }"
packet_zip = f"{name}.Docker.{ version }.zip"
#
tar_file_name = f"{name}.Docker_image.{ version }.tar"
#
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
				f"{ packet }/Foam_Pet.Docker_image_rules.{ version }.E.HTML"
			)))
		},
		
		"the_build_1": {
			"path": str (normpath (join (
				this_folder, 
				"the_build_1"
			))),
			"distribution_directory": str (normpath (join (
				this_folder, 
				f"the_build_1/{ packet }"
			))),
			"image_built": str (normpath (join (
				this_folder, 
				f"the_build_1/{ packet }/{ tar_file_name }"
			))),
			"distribution_zip": str (normpath (join (
				this_folder, 
				f"the_build_1/{ packet_zip }"
			)))
		},
		"the_build_2": {
			"path": str (normpath (join (
				this_folder, 
				f"the_build_2"
			))),
			"distribution_directory": str (normpath (join (
				this_folder, 
				f"the_build_2/{ packet }"
			))),
			"image_built": str (normpath (join (
				this_folder, 
				f"the_build_2/{ packet }/{ tar_file_name }"
			))),
			"distribution_zip": str (normpath (join (
				this_folder, 
				f"the_build_2/{ packet_zip }"
			)))
		},
	}



def run (screenplay):
	print ()
	print ("----")
	print ("screenplay:", screenplay)
	print ()
	# input ("Press Enter to go on:")
	os.system (screenplay)
	print ("----")



def check_image ():
	paths = retrieve_paths ();

	the_build_1__path = paths ["the_build_1"] ["path"]

	the_build_2__path = paths ["the_build_2"] ["path"]
	the_build_2__distribution_zip = paths ["the_build_2"] ["distribution_zip"]
	the_build_2__distribution_directory = paths ["the_build_2"] ["distribution_directory"]
	the_build_2__image_built = paths ["the_build_2"] ["image_built"]
	
	
	
	#
	#	maybe:
	#		[OS] docker rmi Mech_Pet:v1.3.0
	#		[OS] docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
	#
	#		[OS] unzip Mech_Pet_v1.3.0-1.tar.zip
	#		[OS] docker load -i image/Foam_Pet_v1_3_0.0.Docker_image.tar
	#
	shutil.rmtree (the_build_2__path)
	shutil.copytree (the_build_1__path, the_build_2__path)
	
	
	
	#
	#	1. delete the directory "Foam_Pet_v2_0_0.0"
	#	2. unzip zip file
	#	3. remove the image 
	#	4. docker load the .tar
	#	5. stop and remove every container
	#	6. run a container from the iamge
	#
	shutil.rmtree (the_build_2__distribution_directory)
	run (f"""cd '{ the_build_2__path }' && unzip '{ the_build_2__distribution_zip }'""");
	run (f"docker rmi { image_name_plus_version }");
	run (f"docker load -i '{ the_build_2__image_built }'")
	run (f"docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)")
	run (f'docker run --name Mech_Pet_1 -td -e HOST_IP=host.docker.internal -p 22000:22000 -p 21000:21000 -p 443:443 -p 80:80 { image_name_plus_version } /bin/bash -c "bash /embark.sh"')
	
	
	
def make_docker_image ():
	return;

def save_docker_image ():
	paths = retrieve_paths ();

	the_build_1 = paths ['the_build_1'] 
	the_build_1__path = paths ['the_build_1'] ['path']
	the_build_1__distribution_zip = paths ['the_build_1'] ['distribution_zip']
	
	run (f"mkdir -p '{ paths ['the_build_1'] ['distribution_directory'] }'")
	
	#
	#	create:
	#		readme.md
	#		rules
	#
	shutil.copy (paths ["readme"] ["origin"], paths ["readme"] ["destiny"])
	shutil.copy (paths ["rules"] ["origin"], paths ["rules"] ["destiny"])
	
	#
	#	* remove the image
	#	* stop the container
	#	* create an image in the docker drive
	#	* save the image to the drive
	#
	run (f"docker rmi { image_name_plus_version }");
	run (f"docker stop { container_name }");
	run (f"docker commit { container_name } { image_name_plus_version }")
	run (f"docker save -o { paths ['the_build_1'] ['image_built'] } { image_name_plus_version }")
	
	#
	#	zip the directory:
	#		cd the_build_1 
	#		zip Foam_Pet_v2_0_0.0 Foam_Pet_v2_0_0.0.zip
	#
	run (f"(cd '{ the_build_1__path }' && zip -r '{ packet_zip }' '{ packet }')")
	

	
	#
	#	Distribution ZIP
	#
	#	Checksums: 
	#		SHA
	#
	run (f"(cd '{ the_build_1__path }' && sha256sum { the_build_1__distribution_zip })")
	
	
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