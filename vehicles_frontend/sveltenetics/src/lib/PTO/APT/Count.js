
/*
import { ask_APT_count } from '$lib/PTO/APT/Count'
const APT_count_ask = await ask_APT_count ({ 
	address_hexadecimal_string,
	net_path
})
if (APT_count_ask.effective !== "yes") {
	// APT_count_ask.exception
	
	return;
}
 
Octa_count = APT_count_ask.Octa_count;
*/

/*
	possibly relevant:
		// const proceeds = await fetch (`${ net_path }/accounts/${ address_hexadecimal_string }/resources`)
		curl https://api.devnet.aptoslabs.com/v1/accounts/951AEAA8567661777F4FE0161E98EF8CB0680A8E06DE36A63D5E0D5B891E8BD7/resource/0x1::coin::CoinStore%3C0x1::aptos_coin::AptosCoin%3E
		const proceeds = await fetch (`${ net_path }/accounts/${ address_hexadecimal_string }`)
*/



////
//
// import { Aptos, AptosConfig, AccountAddress, Network } from "@aptos-labs/ts-sdk";
//
//
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
import { obtain_string } from '$lib/taverns/procedures/obtain/string'
//
////


export const ask_APT_count = async ({
	address_hexadecimal_string,
	net_path
}) => {
	var resource = `0x1::coin::CoinStore<0x1::aptos_coin::AptosCoin>`

	try {
		const proceeds = await fetch (
			`${ net_path }/accounts/${ address_hexadecimal_string }/resource/${ resource }`
		)
		const status = proceeds.status;
		
		if (status === 404) {
			const enhanced = await proceeds.json ()
			const error_code = obtain_string (enhanced, [ 'error_code' ], '');
			const message = obtain_string (enhanced, [ 'message' ], '');
			
			let exception = ""
			if (error_code === "resource_not_found") {
				exception = [
					error_code + "\n",
					message + "\n",
					`This might be an address that has 0 transactions associated with it.`
				].join ('\n')
				
				// exception = `${ error_code }\n\n${ message}\n\nThis might be an address that has 0 transactions associated with it.`;
			}
			else {
				exception = `${ error_code }: ${ message}`
			}
			
			return {
				error_code,
				effective: "no",
				exception
			}
		}
		if (status === 400) {
			return {
				effective: "no",
				exception: await proceeds.text (),
				error_code: ""
			}
		}
		if (status === 200) {
			const enhanced = await proceeds.json ()
			const Octa_count = enhanced.data.coin.value;

			return {
				effective: "yes",
				exception: "",
				error_code: "",
				
				Octa_count
			}
		}
	}
	catch (imperfection) {
		console.error (imperfection);
	}
	
	return {
		effective: "no",
		exception: "An exception occurred.",
		error_code: ""
	}
}



