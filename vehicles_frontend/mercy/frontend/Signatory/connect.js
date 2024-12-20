

/*
	import { connect_to_signatory } from "@/Signatory/connect"
	await connect_to_signatory ({ wallet_link, wallet_name });
*/

/*
	This is connects the wallet_link
*/
export const connect_to_signatory = async ({ wallet_link, wallet_name }) => {
	console.log ("connect_to_signatory", { wallet_link, wallet_name });
	
	await wallet_link.connect (wallet_name);
	localStorage.setItem ("AptosWalletName", wallet_name);
}