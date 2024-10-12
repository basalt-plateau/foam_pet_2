

******

This module is provided on behalf of the
Real Estate Advancement Development Moves Extraodinaire
for the improvement of medical districts.

******

# Rhythm Filter

## tutorial 

This filters function calls within the "every" filtration interval.

If a filtration interval ends, the last function attempted in
the interval is called.

It is similar to a "throttle" or "intake reducer".

## example
```ecmascript
import { rhythm_filter } from '@medical-district/rhythm-filter'

const RF = rhythm_filter ({
	// every 500 milliseconds
	every: 500
});

function window_size_changed (event) {
	RF.attempt (({ ellipse, is_last }) => {
		// ellipse = new Date ()
		
		console.log ("window size changed", { event })
	});
}

window.addEventListener ("resize", window_size_changed);
// window.removeEventListener ("resize", window_size_changed)
```


```literature
Example:
	With:
		const RF = rhythm_filter ({
			// every 500 milliseconds
			every: 500
		});

	Given an array of calls at:
		[ 0, 200, 600, 900, 1200, 1300, 1400 ]


	This is what happens; 
	however, the clock might be off by a few milliseconds:
	
		0 is called at 0 milliseconds and the filter is in place until 500 milliseconds,
		200 is filtered,
		
		600 is called at 600 milliseconds and the filter is in place until 1100 milliseconds,
		900 is filtered,
		
		1200 is called at 1200 milliseconds and the filter is in place until 1700 milliseconds,
		1300 is filtered,
		
		1400 
			is called at around 1700 milliseconds, 
			since another call did not take place
			between 1200 and 1700.
			It then starts filtering until 1900 milliseconds.
			

```


## Publishing, tcsh
```tcsh
yarn run status && git commit -am --allow-empty && npm version patch && npm publish --access public
```