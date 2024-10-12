

#/
#
from .leaves.TSF import TSF_Fields
from .leaves.TS import TS_Fields
from .leaves.Ask import Ask_Leaf
#
from vivaciousness.health_regions.connect import connect_to_driver
from vivaciousness.procedures.Faucet.Give import give_Octas_from_faucet
from vivaciousness.procedures.loop import loop
#
#
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
#
#
import traceback
import json
import time
import multiprocessing
import concurrent.futures
#
#\


def friends_driver_ask (packet):
	driver_1 = packet ["driver_1"]
	signature_hexadecimal_string = packet ["signature_hexadecimal_string"]
	inner_modal_buttons = packet ["inner_modal_buttons"]
	
	
	inner_modal_buttons ["next"].click ()
	
	TSF_Fields ({
		"driver_1": driver_1,
		"signature_hexadecimal_string": signature_hexadecimal_string
	})
	
	inner_modal_buttons ["next"].click ()
	
	TS_Fields ({
		"driver_1": driver_1,
		"signature_hexadecimal_string": signature_hexadecimal_string
	})
	
	inner_modal_buttons ["next"].click ()
	
	Ask_Leaf ({
		"driver_1": driver_1
	})
	
	time.sleep (10)
	
	return;