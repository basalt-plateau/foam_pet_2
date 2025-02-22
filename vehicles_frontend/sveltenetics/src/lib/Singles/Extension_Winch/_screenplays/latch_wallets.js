
/*
	import { latch_wallets } from "$lib/Singles/Extension_Winch/_screenplays/latch_wallets.js"
	import * as Extension_Winch from "$lib/Singles/Extension_Winch"

	
	await Extension_Winch.make ();
	lease_roomies_truck ()
	lease_Milieus_truck ()
	
	await latch_wallets ();
*/


////
//
import { view_fonction } from "$lib/PTO_API/View/index.js"
import * as Extension_Winch from "$lib/Singles/Extension_Winch"	
//
//
import { Rise_stage_creator } from "./../Stages/Rise.js"
import { Petra_stage_creator } from "./../Stages/Petra.js"
import { Pontem_stage_creator } from "./../Stages/Pontem.js"
//
////


export const latch_wallets = async () => {
	try {
		const Petra_01 = "0xf5565cc1d71781d6ef766a2a50ed459b9d3b430ceb6f7bbf79393c3626a979cd";
		const Pannier_01 = "0x2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD";
		
		const Wallet_Address = Petra_01;
		
		const net_path = "https://api.mainnet.aptoslabs.com/v1";
		
		console.info (
			"Allowed wallets is connecting to hard coded net_path address:", 
			{ net_path }
		);
		
		
		const { result, result_string } = await view_fonction ({
			net_path,
			body: {
				"function": Wallet_Address + "::Allowed_Wallets_02::retrieve",
				"type_arguments": [],
				"arguments": []
			}
		});
		
		
		const allowed_wallets = result [0];
		if (Array.isArray (allowed_wallets) !== true) {
			console.error ("allowed_wallets is not an array.", { allowed_wallets })
		}
		
		
		let EWF = Extension_Winch.freight ();
		if (allowed_wallets.includes ("Petra")) {
			try {
				EWF.stages.Petra = await Petra_stage_creator ({ freight: EWF });
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		}
		if (allowed_wallets.includes ("Rise")) {
			try {
				EWF.stages.Rise = await Rise_stage_creator ({ freight: EWF });
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		}
		if (allowed_wallets.includes ("Pontem")) {
			try {
				EWF.stages.Pontem = await Pontem_stage_creator ({ freight: EWF });
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		}
		
		
			
			
		let stages = EWF.stages;
		for (let stage_name in stages) {
			console.info ("searching for:", stage_name);
			
			try {
				await EWF.stages [ stage_name ].status ();
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		}
		
		console.info ("checking for local storage connection");
		EWF.check_for_local_storage_connection ();
		console.info ("checked for local storage connection");
	}
	catch (imperfection) {
		console.error (imperfection);
	}
}