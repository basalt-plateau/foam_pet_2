




/*
	yarn run test:unit obtain
*/


import { describe, it, expect } from 'vitest'
import assert from 'assert'


import { obtain } from './index.js'
	

describe ('grid obtain', () => {
	it ('can obtain a number', () => {
		assert.equal (
			obtain ('number') ({ 's': 1 }, [ 's' ], null), 
			1
		)
		

		
	})
	
	it ('is operational', () => {

		
	})
})
