



/*
	import { check_signatory_connection } from "@/Signatory/is_connected"
	const is_connected = await check_signatory_connection ({ wallet_link });
*/

/*
	This is connects the wallet_link
*/
export const check_signatory_connection = async ({ wallet_link }) => {
	return await wallet_link.isConnected () ? "yes" : "no"
}