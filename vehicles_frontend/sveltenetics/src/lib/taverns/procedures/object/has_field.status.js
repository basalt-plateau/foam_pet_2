




/*
	yarn run test:unit "src/grid/obtain"
*/


import { describe, it, expect } from 'vitest'
import assert from 'assert'

import { has_field } from './has_field.js'
	
describe ('grid obtain array', () => {
	it ('is operational', () => {
		assert.equal (has_field ({ "s": 1 }, "s"), true)
		assert.equal (has_field ({ "z": 1 }, "s"), false)
	})
	
	it ('not from a bracket', () => {
		assert.equal (has_field ("s", "s"), false)
		assert.equal (has_field (undefined, "s"), false)
	})
})
