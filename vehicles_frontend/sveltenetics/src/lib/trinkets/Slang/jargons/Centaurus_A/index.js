
//
import { account } from './account/index.js'
//
import { blockchain } from './_blockchain'
import { consensus } from './_consensus'
import { machines } from './_machines'
import { move } from './_move'
import { web } from './_web'
//

import { le_label } from './_le_label'

export const Centaurus_A = {
	


	
	
	...account,
	...blockchain,
	...consensus,

	...machines,
	...move,
	
	...web,
	
	...le_label
}