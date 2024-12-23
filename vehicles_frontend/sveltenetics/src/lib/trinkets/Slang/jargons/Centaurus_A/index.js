
import { account } from './_account'
import { blockchain } from './_blockchain'
import { consensus } from './_consensus'
import { machines } from './_machines'
import { move } from './_move'
import { wallet } from './_wallet'
import { web } from './_web'



export const Centaurus_A = {
	// "Pet": "Orbital Covergence Softwhere",	
	// "Pet": "Aptos Softwhere",	

	"this_domain": "https://Foam.Pet",
	"This Domain": "https://Foam.Pet",
	
	"the_pypi_module": "foam_pet",

	"label": "foam pet",
	"labels": "foam pets",		
	"Pet": "Foam Pet",	
	"pet": "foam pet",		
	"Pets": "Foam Pets",	
	
	
	
	"Aptos": "Aptos",
	
	...account,
	...blockchain,
	...consensus,

	...machines,
	...move,
	
	...wallet,
	...web	
}