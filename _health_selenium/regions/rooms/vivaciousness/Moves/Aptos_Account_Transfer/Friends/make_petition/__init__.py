

''''
from vivaciousness.Moves.Aptos_Account_Transfer.Friends.make_transation_petition import make_transation_petition
make_transation_petition ()
"'''


#\
#
import traceback
import json
import time
import multiprocessing
import concurrent.futures
#
#
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
#
#
#
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness.procedures.Faucet.Give import give_Octas_from_faucet
from vivaciousness.procedures.loop import loop
#
from .check_the_petition_form import check_the_petition_form
from .check_the_petition import check_the_petition
from .check.petition_bracket import check_the_petition_bracket
#
#/

''''
	This needs to go through:
		Open the modal
	
		Petition Form
		Petition Verification
		Petition (Send)
"'''


def make_petition (packet):
	driver_1 = packet ["driver_1"]
	
	modal_navigation_buttons = packet ["modal_navigation_buttons"]
	address_from = packet ["address_from"]
	address_to = packet ["address_to"]
	amount_APT = packet ["amount_APT"]
	
	
	#\
	#
	#	Petition Form: Modify Fields
	#
	#
	check_the_petition_form ({
		"driver_1": driver_1,
		
		"address_from": packet ["address_from"],
		"address_to": packet ["address_to"],
		"amount_APT": packet ["amount_APT"]
	})
	modal_navigation_buttons ["next"].click ()
	#/
	
	#\
	#
	#	Petition Verification
	#
	#
	check_the_petition_bracket ({
		"driver_1": driver_1
	})
	modal_navigation_buttons ["next"].click ()
	#/
	
	#\
	#
	#	Petition
	#
	#
	[ petition_as_hexadecimal ] = check_the_petition ({
		"driver_1": driver_1
	})
	assert (len (petition_as_hexadecimal) >= 1), petition_as_hexadecimal
	#/
	
	
	#
	#
	#	Petition
	#
	#
	return [ petition_as_hexadecimal ]
