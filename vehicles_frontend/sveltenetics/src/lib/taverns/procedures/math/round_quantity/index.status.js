
/*
	yarn run status "math/round_quantity"
*/

import { describe, it, expect } from 'vitest'
import assert from 'assert'

import { round_quantity } from './index'


describe ('grid round_quantity', () => {
	it ('rounds quantities to 2 decimal places', () => {
		assert.deepEqual (round_quantity (91.555), '91.56')
		assert.deepEqual (round_quantity (91.3123), '91.31')
		assert.deepEqual (round_quantity (1.3123), '1.31')
		assert.deepEqual (round_quantity (1), '1.00')
		assert.deepEqual (round_quantity (0), '0.00')
		
		assert.deepEqual (round_quantity (-1), '-1.00')
		assert.deepEqual (round_quantity (-91.47823), '-91.48')
		assert.deepEqual (round_quantity (-91.555), '-91.55')

		assert.deepEqual (round_quantity ('0'), '0.00')
		assert.deepEqual (round_quantity ('-91.123'), '-91.12')

		assert.deepEqual (round_quantity (''), '')		
		assert.deepEqual (round_quantity ('S'), '')
	})
	
	it ('rounds quantities to 3 decimal places', () => {
		assert.deepEqual (round_quantity (91.555, 3), '91.555')
		assert.deepEqual (round_quantity (91.3123, 3), '91.312')
		assert.deepEqual (round_quantity (1.3123, 3), '1.312')
		assert.deepEqual (round_quantity (1.31, 3), '1.310')
		assert.deepEqual (round_quantity (1, 3), '1.000')
		assert.deepEqual (round_quantity (0, 3), '0.000')
		
		assert.deepEqual (round_quantity (-1, 3), '-1.000')
		assert.deepEqual (round_quantity (-91.47823, 3), '-91.478')
		assert.deepEqual (round_quantity (-91.47883, 3), '-91.479')
		assert.deepEqual (round_quantity (-91.555, 3), '-91.555')

		assert.deepEqual (round_quantity ('0', 3), '0.000')
		assert.deepEqual (round_quantity ('-91.123', 3), '-91.123')

		assert.deepEqual (round_quantity ('', 3), '')		
		assert.deepEqual (round_quantity ('S', 3), '')
	})
})
