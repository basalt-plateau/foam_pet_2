

/*
	await suggest_petition ({
		private_key: ,
		
		net_path,
		
		petition: {
			origin_address: Aptos_SDK.AccountAddress.from (
				Uint8Array_from_string (from_address_hexadecimal_string)
			),
			data: {
				function: "0x1::coin::transfer",
				typeArguments,
				functionArguments
			}
		}
	})
*/

import * as Aptos_SDK from "@aptos-labs/ts-sdk";
import { Account_from_private_key } from '$lib/PTO/Accounts/from_private_key'

export const suggest_petition = async ({
	fonction_type,
	
	net_path,
	
	is_legacy_address,
	
	private_key_hexadecimal_string,
	petition
}) => {
	
	const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
		fullnode: net_path,
		network: Aptos_SDK.Network.CUSTOM
		// client: { provider: custom_client }
	}));
	
	if (fonction_type === "View") {
		console.info (petition.gift)
		
		const proceeds = await aptos.view ({ payload: petition.gift });
		return { proceeds };
	}
	else {
		/*
		
			sender = origin address
		
		*/
		
		console.info ({
			sender: petition.sender,
			data: petition.data
		});
		
		const le_petition = await aptos.transaction.build.simple ({
			sender: petition.sender,
			data: petition.data
		});
		
		
		console.info ({ le_petition });
		
		/*
		//
		//
		//	Simulation
		//
		//
		const [ userTransactionResponse ] = await aptos.transaction.simulate.simple({
			signerPublicKey: sender.publicKey,
			transaction: le_petition
		});
		*/
		
		const {
			pristine_account,
			legacy_account,
			
			public_key_hexadecimal_string,	

			pristine_address_hexadecimal_string,
			legacy_address_hexadecimal_string,
		} = await Account_from_private_key ({
			private_key_hexadecimal_string
		})

		
		console.log ({
			public_key_hexadecimal_string,
	
			pristine_address_hexadecimal_string,
			legacy_address_hexadecimal_string
		})

		if (is_legacy_address === "yes") {
			const committed_transaction = await aptos.signAndSubmitTransaction ({ 
				signer: legacy_account, 
				transaction: le_petition
			});
			
			console.log ({ committed_transaction });

			await aptos.waitForTransaction ({ 
				transactionHash: committed_transaction.hash 
			});
			
			// throw new Error ("Legacy Addresses are not yet accounted for.")
		}
		else {
			console.log ({ pristine_account, le_petition });
			
			const committed_transaction = await aptos.signAndSubmitTransaction ({ 
				signer: pristine_account, 
				transaction: le_petition
			});
			
			console.log ({ committed_transaction });

			await aptos.waitForTransaction ({ 
				transactionHash: committed_transaction.hash 
			});
			
			
			return 
		}
	}
}