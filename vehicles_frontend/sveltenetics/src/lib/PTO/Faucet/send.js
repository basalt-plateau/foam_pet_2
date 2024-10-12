



/*
	import { send_coins_from_faucet } from '$lib/PTO/Faucet/send'
	const { tx } = await send_coins_from_faucet ({
		amount:
		address:
		URL: 'https://faucet.devnet.aptoslabs.com/mint'
	})
*/

/*
	curl -X POST
'https://faucet.devnet.aptoslabs.com/mint?amount=10000&address=0xd0f523c9e73e6f3d68c16ae883a9febc616e484c4998a72d8899a1009e5a89d6'
 * 
 * curl -X POST 'https://faucet.devnet.aptoslabs.com/mint?amount=100000000&address=50F1B72EF645E6AB844C8D49071FF8799AEFBE7C018C9CAF016C309A72FD426B'
*/

export const send_coins_from_faucet = async ({
	amount,
	address,
	URL
}) => {
	const params = new URLSearchParams({
		amount,
		address
	});	

	const ICANN_address = `${URL}?${params.toString()}`
	console.log ({ ICANN_address, amount, params });


	const proceeds = await fetch (ICANN_address, {
		method: 'POST',
		headers: {
			// 'Content-Type': 'application/json'
		}
	});
	
	const enhance = await proceeds.json ()
	
	return {
		tx: enhance [ 0 ]
	};	
}