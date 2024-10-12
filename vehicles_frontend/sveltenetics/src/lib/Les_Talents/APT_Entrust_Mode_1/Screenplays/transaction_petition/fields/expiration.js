
/*
	import { 
		pick_expiration 
	} from '$lib/Les_Talents/APT_Entrust_Mode_1/Screenplays/transaction_petition/fields/expiration'
*/

/*
	import { pick_expiration } from '../fields/expiration'
	const expireTimestamp = pick_expiration ({ 
		after_seconds: 600 
	})
*/

import * as Aptos_SDK from "@aptos-labs/ts-sdk";

export const pick_expiration = ({
	after_seconds
}) => {
	console.info ({ after_seconds })
	
	const after_seconds_ = parseInt (after_seconds);
	const expireTimestamp = new Aptos_SDK.U64 (Math.floor (Date.now () / 1000) + after_seconds_).value;
	
	// console.log ("exp:", expireTimestamp)
	// console.log ("now:", Math.floor (Date.now () / 1000))

	console.info ({ expireTimestamp })

	
	return expireTimestamp
}