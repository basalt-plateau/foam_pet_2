




/*
	yarn run test:unit obtain
*/


import { describe, it, expect } from 'vitest'
import assert from 'assert'

import { obtain_string } from './string'

describe ('grid obtain string', () => {
	it ('is operational', () => {
		assert.equal (
			obtain_string ({ 's': '1' }, [ 's' ], null), 
			'1'
		)
		
		assert.equal (
			obtain_string ({ 's': '1' }, [ 'w' ], null), 
			''
		)
		
		assert.equal (
			obtain_string ({ 's': '1' }, [ 'w' ], '1234'), 
			'1234'
		)
		
	})
	
	it ('is operational', () => {
		assert.equal (
			obtain_string ('1'), 
			'1'
		)
		
		
		assert.equal (
			obtain_string (null), 
			''
		)
		
		assert.equal (
			obtain_string (1234),
			''
		)
		
	})
})
