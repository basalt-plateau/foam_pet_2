

/*
	//
	//	After "stop" the monitor is off, but the bracket_pro 
	//
	//

	import { monitor } from '$lib/taverns/bracket/monitor'
	
	const bracket = {
		liability: 1,
		responsibility: 2,
		obligation: 3,
		injabulo: {
			furaha: 4
		}
	};
	const { bracket_pro, stop } = monitor (bracket, ({ target, property, value }) => {
		try {
			if (target === bracket.injabulo) {
				console.log ("injabulo changed");
			}		
		}
		catch (exception) {
			console.error ("exception", exception);
		}
	});
	
	stop ();
*/

/*
	import { monitor_bracket } from '$lib/taverns/bracket/monitor'
	
	let bracket = {}
	monitor_bracket (bracket, ({
		target,
		property,
		value
	}) => {
		
	});
	
	// to stop, overwrite the original bracket:
	bracket = {}
*/

export const monitor = (original_bracket, on_change) => {
	let monitored_bracket = monitor_bracket (original_bracket, on_change)
	
	return {
		bracket_pro: monitored_bracket,
		bracket_original: original_bracket,
		stop () {
			monitored_bracket.__proto__ = Object.prototype;
			monitored_bracket = {}
			
			// original_bracket = {}
		}
	}
}

export const monitor_bracket = (bracket, on_change) => {	
	let handler = {
		get (target, property, receiver) {
			// console.log ("monitor bracket  get:", { target, property, receiver });
			
			try {
				return new Proxy (target [ property ], handler);
			} 
			catch (err) {
				return Reflect.get (target, property, receiver);
			}
		},
		set (target, property, value, receiver) {
			const current = target [ property ];
			
			// console.log ("monitor bracket set:", { target, property, value, receiver })
			
			const success = Reflect.set (target, property, value, receiver);
			if (success && current !== value) {
				on_change ({
					
					
					property,
					value,
					
					target,
					receiver
				});
			}
			
			return success;
		}
	}
	
	return new Proxy (bracket, handler);
};

