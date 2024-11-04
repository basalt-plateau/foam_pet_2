

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


export async const suggest_petition = ({
	private_key,
	petition
}) => {
	
	const aptos = new Aptos_SDK.Aptos (new Aptos_SDK.AptosConfig ({		
		fullnode: net_path,
		network: Aptos_SDK.Network.CUSTOM
		// client: { provider: custom_client }
	}));
	
	const petition = await aptos.transaction.build.simple ({
		sender: alice.accountAddress,
		data: petition.data
	});
	
	
	//
	//
	//	Simulation
	//
	//
	const [ userTransactionResponse ] = await aptos.transaction.simulate.simple({
        signerPublicKey: sender.publicKey,
        transaction: petition
    });

	//
	//
	//
	//
	//
	console.log ("\n=== Transfer transaction ===\n");
	const committed_transaction = await aptos.signAndSubmitTransaction ({ 
		signer: petition.origin_address, 
		transaction: petition.data
	});

	await aptos.waitForTransaction ({ 
		transactionHash: committedTxn.hash 
	});
	
	
	console.log(`Committed transaction: ${committedTxn.hash}`);

}