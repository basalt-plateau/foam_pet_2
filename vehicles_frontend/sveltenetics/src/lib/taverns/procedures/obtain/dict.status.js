




/*
	yarn run status "obtain/dict"
*/


import { describe, it, expect } from 'vitest'
import assert from 'assert'

import { obtain_dict } from './dict.js'
	
	

describe ('grid obtain dict', () => {
	it ('is operational', () => {
		const d1 = obtain_dict ({ 's': { '1': false } }, [ 's' ], {});
		assert.equal (d1 ['1'], false)
		assert.equal (Object.keys (d1), 1)


		const d2 = obtain_dict ({}, [ 's' ], {});
		assert.equal (Object.keys (d2), 0)
	})
	
	it ('is operational', () => {
		const column = {
			styles: {
				th: {
					"width": "200px"
				}
			}
		}
		
		const d1 = obtain_dict (column, [ "styles", "th" ], {});
		
		console.log ('d1', { d1 })
		
		assert.equal (d1 ['width'], '200px')
	})
	
	it ('is operational', () => {
		const d1 = obtain_dict ({ '1': false });
		assert.equal (Object.keys (d1), 1)
		assert.equal (d1 ['1'], false)
	})
	
	it ('breaks operationally', () => {
		const d1 = obtain_dict ('1');
		assert.equal (Object.keys (d1), 0)
		assert.equal (Object.keys (d1).length, 0)
		assert.equal (Array.isArray (d1), false)
		
	})
})
