


// bun run vitest "src/lib/taverns/bracket/monitor.vitest.js" --silent=false


	
import { describe, it, expect } from 'vitest';
import assert from 'assert'

import _set from 'lodash/set'
import cloneDeep from 'lodash/cloneDeep'

import { monitor_bracket, monitor } from './monitor'
	
describe ("bracket monitor", () => {
	it ("monitor", async () => {
		const story = []

		const bracket = {
			liability: 1,
			responsibility: 2,
			obligation: 3,
			
			furaha: 0,
			
			injabulo: {
				furaha: 0
			},
			
			parador: {
				injabulo: {
					furaha: 0
				}
			}
		};
		
		let furaha_changes = 0;
		const { bracket_pro, stop } = monitor (bracket, ({ target, property, value }) => {
			try {
				if (target === bracket.injabulo && property === "furaha") {
					console.log ("furaha changed");
					furaha_changes++;
				}		
			}
			catch (exception) {
				console.error ("exception", exception);
			}
		});
		
		//
		// target
		//
		
		assert.equal (furaha_changes, 0)
		bracket_pro.injabulo.furaha = 2;
		assert.equal (furaha_changes, 1)

		bracket_pro.injabulo.furaha2 = 1;
		assert.equal (furaha_changes, 1)

		bracket_pro.parador.injabulo.furaha = 1;
		assert.equal (furaha_changes, 1)

		bracket_pro.furaha = 1;
		assert.equal (furaha_changes, 1)
		
		stop ();
	});
	
	it ("it fonctions", async () => {
		const story = []

		const { bracket_pro, bracket_original, stop } = monitor ({
			furaha: 1,
			injabulo: {
				activity: 1
			},
			liability: 1,
			responsibility: 2,
			obligation: 3
		}, ({ target, receiver, property, value }) => {
			// console.log ({ target, receiver, property, value });
			story.push ({ target, receiver, property, value });
		});
		
		// console.log ({ bracket_original });
		
		bracket_pro.furaha = 2;
		assert.equal (story [0].value, 2)
		assert.equal (story [0].property, "furaha")
		assert.equal (story.length, 1)
		
		bracket_pro.injabulo.activity = 2;
		assert.equal (story [1].value, 2)
		assert.equal (story [1].target, bracket_original.injabulo)
		assert.equal (story.length, 2)
		
		console.log (`
		
			stopping
		
		`)
		stop ();
		
		
		// console.log ({ bracket_original, bracket_pro});
		
		bracket_pro.furaha = 2;		
		bracket_pro.injabulo.activity = 2;
		assert.equal (story.length, 2)
	});
	
	it ("it fonctions", async () => {
		const story = []

		const freight = {
			furaha: 1,
			injabulo: {
				activity: 1
			}
		};
		const freight_pro = monitor_bracket (freight, ({
			target,
			receiver,
			
			property,
			value
		}) => {
			// console.info ("build_truck_2:", { target, property, value });
			
			story.push ({ target, receiver, property, value });
		});
		
		// console.log ({ freight_pro });


		// bracket.a = 1;
		freight_pro.furaha = 2;
		assert.equal (story [0].value, 2)
		assert.equal (story [0].property, "furaha")
		
		freight_pro.injabulo.activity = 2;
		assert.equal (story [1].value, 2)
		assert.equal (story [1].target, freight.injabulo)
		
		//
		//
		//
		//
		assert.notEqual (story [1].receiver, freight.injabulo)
		
		//
		//	
		//
		//
		assert.notEqual (story [1].target, freight_pro.injabulo)
		assert.notEqual (story [1].receiver, freight_pro.injabulo)
	});
})