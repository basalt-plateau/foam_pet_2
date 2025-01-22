

// $lib/trucks/truck_1/index.js
/*
	https://explorer.aptoslabs.com/account/0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd/modules/view/Rules_10?network=devnet
*/

import { build_truck } from '@visiwa/trucks'

const trucks = {}


var public_addresses = Object.freeze ({
	"Petra": "F5565CC1D71781D6EF766A2A50ED459B9D3B430CEB6F7BBF79393C3626A979CD",
	"Dev": "0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C"
});

/*
	This adds a truck to the trucks object as trucks [1] = ...
	Such, the truck can then be deleted with the "destroy" method.
*/
export const make = async () => {
	
	/*
		Freight is the "state" or the object that is
		is monitored.
	*/
	trucks [1] = build_truck ({
		freight: {
			Publisher_Address: "F5565CC1D71781D6EF766A2A50ED459B9D3B430CEB6F7BBF79393C3626A979CD"
		}
	});
	
	/*
		Changes to the freight can be monitored here:
		
			* 	original_freight: 
					is the "freight" object that was passed to:
					build_truck ({ freight });

			* 	pro_freight:
					is the proxy object that encapsulates
					the original_freight for monitoring purposes.
			
			* 	bracket: the bracket or sub-bracket where the change occurred.
			
			* 	property: the property that changed
			* 	value: the value that changed
	*/
	let monitor = trucks [1].monitor (async ({
		original_freight,
		pro_freight, 
		//
		bracket,
		//
		property, 
		value
	}) => {
		try {
			// leaf name changed
			if (bracket === original_freight && property === "leaf_name") {
				console.info ("leaf name changed");
			}
			
			// Leaf 1 alert_success changed
			if (bracket === original_freight.leaves ["Leaf 1"] && property === "alert_success") {
				console.info ("Leaf 1 alert_success changed.");
			}
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	});
}

export const destroy = () => {
	delete trucks [1];
}

export const retrieve = () => {
	return trucks [1];
}


/*
	Changes to the freight can also be monitored like this.
	This adds another monitor each time "monitor" is called.
	
	An example implementation can be found below.
*/
export const monitor = (action) => {	
	return trucks [1].monitor (envelope => { action (envelope); });
}