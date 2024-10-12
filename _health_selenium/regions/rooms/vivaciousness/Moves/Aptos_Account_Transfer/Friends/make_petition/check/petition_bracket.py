

''''
	from .check.petition_bracket import check_the_petition_bracket
	check_the_petition_bracket ({
		"driver_1": driver_1
	})
"'''


import json
import time

from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select

from vivaciousness.procedures.loop import loop
from vivaciousness.Moves.Aptos_Account_Transfer.TP_Object_Checks.TP_1 import check_TP_Object


def find_bracket (tailfin):
	#
	#
	#	document.querySelectorAll ("[monitor='petition verification'] [monitor='petition as bracket'] [code_wall_text]")
	#
	petition_bracket_element = tailfin.find_element (
		By.CSS_SELECTOR, 
		"[monitor='petition verification'] [monitor='petition as bracket'] [code_wall_text]"
	)
	
	print ("petition_bracket_element:", petition_bracket_element)
	print ("petition_bracket_text:", petition_bracket_element.text)
	
	petition_bracket = json.loads (petition_bracket_element.text)
	check_TP_Object ({
		"petition_bracket": petition_bracket
	})
	
	return petition_bracket_element;


def check_the_petition_bracket (packet):
	tailfin = packet ["driver_1"]
	
	petition_bracket_element = loop (lambda : find_bracket (tailfin))
	
	
	
	
