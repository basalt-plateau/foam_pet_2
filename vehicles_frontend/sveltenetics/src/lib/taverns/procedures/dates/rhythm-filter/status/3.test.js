
/*
	yarn run status status/3.test.js
*/

import { expect, test } from 'vitest'
import assert from 'assert'

import { rhythm_filter } from './../index.js'

test ("3", async () => {
	const AWAITS = [ 0, 111, 200, 248, 600, 1000, 1139, 1151, 1161, 1181, 1200 ]
	const PUTS = []
	
	const RF = rhythm_filter ({
		every: 500
	});

	for (let S = 0; S < AWAITS.length; S++) {
		const AWAIT = AWAITS [S]
		
		setTimeout (() => {
			RF.attempt (({ ellipse, is_last }) => {
				PUTS.push (AWAIT)
			});
		}, AWAIT)
	}
	
	await new Promise (FULLFIL => {
		setTimeout (() => {
			FULLFIL ()
		}, 2000)
	})

	assert.equal (
		JSON.stringify (PUTS),
		JSON.stringify ([ 0, 600, 1139, 1200 ])
	)
})