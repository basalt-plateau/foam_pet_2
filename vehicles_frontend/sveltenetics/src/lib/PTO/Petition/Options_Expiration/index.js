



/*
	import { pick_expiration } from '$lib/PTO/Petition/Options_Expiration'
	const { expiration_timestamp } = pick_expiration ({ 
		after_seconds: 600 
	})
*/

/*
	
*/

import * as Aptos_SDK from "@aptos-labs/ts-sdk";

export const pick_expiration = ({
	after_seconds
}) => {
	const after_seconds_ = parseInt (after_seconds);
	const expiration_timestamp = new Aptos_SDK.U64 (Math.floor (Date.now () / 1000) + after_seconds_).value;
	

	
	return {
		expiration_timestamp
	}
}

