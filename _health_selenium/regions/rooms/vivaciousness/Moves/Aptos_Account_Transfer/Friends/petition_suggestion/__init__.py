

''''
from vivaciousness.Moves.Aptos_Account_Transfer.Friends.petition_suggestion import petition_suggestion
petition_suggestion ({
	"tailfin": "",
	"modal_navigation_buttons": ""
})
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
from ..leaves.signature_field import monitor_signature_field
from ..leaves.signature_verification import monitor_signature_verification
from ..leaves.suggestion import monitor_suggestion
#
#/

''''
	This needs to go through:
		Open the modal
	
		Petition Form
		Petition Verification
		Petition (Send)
"'''
def petition_suggestion (packet):
	tailfin = packet ["tailfin"]
	modal_navigation_buttons = packet ["modal_navigation_buttons"]
	signature_hexadecimal_string = packet ["signature_hexadecimal_string"]
	
	#\
	#
	#	Signature Field
	#
	#
	monitor_signature_field ({
		"tailfin": tailfin,
		"signature_hexadecimal_string": signature_hexadecimal_string
	})
	modal_navigation_buttons ["next"].click ()
	#/
	
	#\
	#
	#	Signature Verfication
	#
	#
	monitor_signature_verification ({
		"tailfin": tailfin
	})
	modal_navigation_buttons ["next"].click ()
	#/
	
	
	#\
	#
	#	Suggestion
	#
	#
	monitor_suggestion ({
		"tailfin": tailfin
	})
	#/
	
	return;
