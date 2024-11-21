


/*
	(cd /Metro/vehicles_frontend/sveltenetics && pnpm run health "src/lib/PTO/Address/Sequence_Number/index.vitest.js")
*/


import { describe, it, expect } from 'vitest';
import assert from 'assert'

import { send_coins_from_faucet } from '$lib/PTO/Faucet/send'
import { ask_sequence_number } from '$lib/PTO/Address/Sequence_Number'
	
describe ('[unfinished] address, sequence_number', () => {
	it ('1', async () => {
		const address = "0f77ed769edda3660495078937d366dc9a133837a816718d6058276f723c8fa8"
		
		const { tx } = await send_coins_from_faucet ({
			amount: 1000000,
			address,
			URL: 'https://faucet.devnet.aptoslabs.com/mint'
		});
		
		
		/*
		const { sequence_number } = await ask_sequence_number ({ 
			net_path: 'https://api.devnet.aptoslabs.com/v1',
			address
		})	
		
		console.log ({ sequence_number });
		*/
	});
});