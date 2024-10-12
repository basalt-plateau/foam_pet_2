
''''
	make_signature ({
		"tailfin": tailfin
	})
"'''

#\
#
import concurrent.futures
import json
import multiprocessing
import traceback
import time
#
#
from selenium.webdriver.common.by import By
#
#
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness.procedures.Faucet.Give import give_Octas_from_faucet
from vivaciousness.procedures.loop import loop
#
from ..leaves.petition_field import monitor_petition_field
from ..leaves.petition_verification import monitor_petition_verification
from ..leaves.signature_field import monitor_signature_field
from ..leaves.signature_verification import monitor_signature_verification
from ..leaves.signature import monitor_signature
#
#/


def make_signature (packet):
	tailfin = packet ["tailfin"]
	petition_hexadecimal_string = packet ["petition_hexadecimal_string"]
	relatives_modal_navigation_buttons = packet ["relatives_modal_navigation_buttons"]
	
	origin_private_key = packet ["origin_private_key"]
	origin_address_is_legacy = packet ["origin_address_is_legacy"]

	#
	#
	#	Petition Field
	#
	#
	monitor_petition_field ({
		"tailfin": tailfin,
		"petition_hexadecimal_string": petition_hexadecimal_string
	});
	relatives_modal_navigation_buttons ["next"].click ()
	
	
	#
	#
	#	Petition Verification
	#
	#
	monitor_petition_verification ({
		"tailfin": tailfin
	})
	relatives_modal_navigation_buttons ["next"].click ()
	
	
	#
	#
	#	Signature Field: Creates Signature
	#
	#
	monitor_signature_field ({
		"tailfin": tailfin,
		
		"origin_private_key": origin_private_key,
		"origin_address_is_legacy": origin_address_is_legacy
	})
	relatives_modal_navigation_buttons ["next"].click ()
	
	#
	#
	#	Signature Verification
	#
	#
	monitor_signature_verification ({
		"tailfin": tailfin
	})
	relatives_modal_navigation_buttons ["next"].click ()
	
	#
	#
	#	Signature Communication
	#
	#
	[ signature_hexadecimal_string ] = monitor_signature ({
		"tailfin": tailfin
	})

	return [
		signature_hexadecimal_string
	]