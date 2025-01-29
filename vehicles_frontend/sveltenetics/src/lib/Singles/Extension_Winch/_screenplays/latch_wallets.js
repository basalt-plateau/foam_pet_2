
/*
	import { latch_wallets } from "$lib/Singles/Extension_Winch/_screenplays/latch_wallets.js"
*/

import { view_fonction } from "$lib/PTO_API/View/index.js"
import * as Extension_Winch from "$lib/Singles/Extension_Winch"	

import { Rise_stage_creator } from "./../Stages/Rise.js"
import { Petra_stage_creator } from "./../Stages/Petra.js"
import { Pontem_stage_creator } from "./../Stages/Pontem.js"

export const latch_wallets = async () => {
	const { result, result_string } = await view_fonction ({
		body: {
			"function": "0xf5565cc1d71781d6ef766a2a50ed459b9d3b430ceb6f7bbf79393c3626a979cd::Allowed_Wallets_02::retrieve",
			"type_arguments": [],
			"arguments": []
		}
	});
	
	const allowed_wallets = result [0];
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
	
}