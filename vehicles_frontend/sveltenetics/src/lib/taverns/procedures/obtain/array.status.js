




/*
	yarn run status "obtain/array"
*/


import { describe, it, expect } from 'vitest'
import assert from 'assert'

import { obtain_array } from './array.js'
	
	

describe ('grid obtain array', () => {
	it ('is operational', () => {
		const a1 = obtain_array ({ 's': [ '1' ] }, [ 's' ], null);
		assert.equal (a1[0], '1')
		assert.equal (a1.length, 1)

		const a2 = obtain_array ({}, [ 's' ], null);
		assert.equal (a2.length, 0)
	})
	
	it ('is operational', () => {
		const a1 = obtain_array ([ '1', '2' ]);
		assert.equal (a1.length, 2)
		assert.equal (a1 [0], '1')
		assert.equal (a1 [1], '2')


		
	})
})
