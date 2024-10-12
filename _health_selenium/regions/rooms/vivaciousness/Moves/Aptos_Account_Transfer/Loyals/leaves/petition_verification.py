

#\
#
import time
import json
#
#
from selenium.webdriver.common.by import By
#
#
from vivaciousness.procedures.loop import loop
#
from vivaciousness.Moves.Aptos_Account_Transfer.TP_Object_Checks.TP_1 import check_TP_Object
#
#/

''''
	[monitor="petition verification leaf"]
		[monitor="petition bracket"]
		[monitor="petition hexadecimal"]
		
	[monitor="bracket panel"]
		[monitor="bracket panel 2"]
			[code_wall_text]
"'''

def monitor_petition_verification (packet):
	tailfin = packet ["tailfin"]
	
	leaf = '[monitor="petition verification leaf"]'
	
	def has_elements ():
		tailfin.find_element (
			By.CSS_SELECTOR, 
			leaf
		)
		tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{leaf} [monitor="bracket panel"]'
		)
		petition_bracket_element = tailfin.find_element (
			By.CSS_SELECTOR, 
			f'{leaf} [monitor="bracket panel"] [monitor="bracket panel 2"] [code_wall_text]'
		)
		
		petition_bracket = json.loads (petition_bracket_element.text);
		check_TP_Object ({
			"petition_bracket": petition_bracket
		})
		
	loop (has_elements);


	

	
