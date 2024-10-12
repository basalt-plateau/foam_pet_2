
/*
	yarn run status status/3.test.js
*/

import { expect, test } from 'vitest'
import assert from 'assert'

import { rhythm_filter } from './../index.js'

test ("4", async () => {
	const alarms = [ 0, 200, 600, 900, 1200, 1300, 1400 ]
	const called = []
	
	const RF = rhythm_filter ({
		every: 500
	});

	for (let S = 0; S < alarms.length; S++) {
		const alarm = alarms [S]
		
		setTimeout (() => {
			RF.attempt (({ ellipse, is_last }) => {
				called.push (alarm)
			});
		}, alarm)
	}
	
	await new Promise (fulfill => {
		setTimeout (() => {
			fulfill ()
		}, 2000)
	})

	assert.equal (
		JSON.stringify (called),
		JSON.stringify ([ 0, 600, 1200, 1400 ])
	)
})