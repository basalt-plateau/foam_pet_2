
/*
	yarn run status status/2.test.js
*/


import { expect, test } from 'vitest'
import assert from 'assert'

import { rhythm_filter } from './../index.js'

test ("2", async () => {
	const AWAITS = [ 0, 200, 600, 1000, 1139, 1151 ]
	const PUTS = []
	
	const RF = rhythm_filter ({
		every: 500
	});

	setTimeout (() => {
		RF.attempt (({ ellipse, is_last }) => {
			console.log ("DATE", ellipse)
			console.log ("PUSHING", 0)
			PUTS.push (0)
		});
	}, 0)

	setTimeout (() => {
		RF.attempt (({ ellipse, is_last }) => {
			console.log ("DATE", ellipse)
			console.log ("PUSHING", 200)
			PUTS.push (200)
		});
	}, 200)
	
	setTimeout (() => {
		RF.attempt (({ ellipse, is_last }) => {
			console.log ("DATE", ellipse)
			console.log ("PUSHING", 600)
			PUTS.push (600)
		});
	}, 600)
	
	setTimeout (() => {
		RF.attempt (({ ellipse, is_last }) => {
			console.log ("DATE", ellipse)
			console.log ("PUSHING", 1000)
			PUTS.push (1000)
		});
	}, 1000)
	
	setTimeout (() => {
		RF.attempt (({ ellipse, is_last }) => {
			console.log ("DATE", ellipse)
			console.log ("PUSHING", 1139)
			PUTS.push (1139)
		});
	}, 1139)
	
	setTimeout (() => {
		RF.attempt (({ ellipse, is_last }) => {
			console.log ("DATE", ellipse)
			console.log ("PUSHING", 1151)
			PUTS.push (1151)
		});
	}, 1151)
	
	await new Promise (FULLFIL => {
		setTimeout (() => {
			FULLFIL ()
		}, 2000)
	})

	assert.equal (
		JSON.stringify (PUTS),
		JSON.stringify ([ 0, 600, 1139, 1151 ])
	)
})