


import { expect, test } from 'vitest'
import assert from 'assert'

import { rhythm_filter } from './../index.js'

test ("1", async () => {
	let CALLED = 0;
	
	const RF = rhythm_filter ({
		every: 500
	});
	
	let IS_LAST_CALLS = 0
	let IS_NOT_LAST_CALLS = 0
	
	/*
	
	*/
	for (let S = 1; S <= 13; S++) {
		console.log ({ S })
		
		await new Promise (F => {
			setTimeout (() => {
				RF.attempt (({ ellipse, is_last }) => {
					let DATE_STRING = ellipse.getSeconds().toString() + ":";
					DATE_STRING += ellipse.getMilliseconds().toString() + " ";
					
					CALLED++;
					
					if (is_last) {
						IS_LAST_CALLS++
					}
					else {
						IS_NOT_LAST_CALLS++
					}
					
					console.log ({ CALLED, DATE_STRING, S, is_last })	
				});
				
				F ()
			}, 100);				
		})
	}
		
	assert.equal (CALLED, 3)
	assert.equal (IS_LAST_CALLS, 0)
	assert.equal (IS_NOT_LAST_CALLS, 3)
	
	await new Promise (F => {
		setTimeout (() => {
			F ()
		}, 1000);				
	}) 
	
	assert.equal (CALLED, 4)
	assert.equal (IS_LAST_CALLS, 1)
	assert.equal (IS_NOT_LAST_CALLS, 3)
})