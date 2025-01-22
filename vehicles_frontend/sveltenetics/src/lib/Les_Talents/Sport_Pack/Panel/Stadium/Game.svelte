

<script>

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"

import * as Truck_1 from '$lib/Les_Talents/Sport_Pack/Panel/Truck/index.js'
import Sport_Pack_Ride from '$lib/Les_Talents/Sport_Pack/Panel/Truck/Ride.svelte'
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'


	

let Sport_Pack_Freight = false
let EWF = false

// 1,00000,00000 = 10,000,000,000
// 2,50000,00000 = 25,000,000,000
// 5,00000,00000 = 50,000,000,000
// 614
let Planet_IV_Units = 10000000000;

/*
	public entry fun Build (
		consenter : & signer,
		boar_Planet_IVs_for_sale : u256
	)
*/
const begin = async () => {
	let fonction = (
		Sport_Pack_Freight.Publisher_Address + 
		"::" +
		"Boar_Game_Module" +
		"::" +
		"Build"
	);
	
	console.log ({ fonction });
	
	try {
		const { result, note, transaction } = await EWF.prompt ({
			petition: {
				function: fonction,
				type_arguments: [],
				arguments: [
					Planet_IV_Units
				]
			}
		});
		console.info ("transfer progress",  { result, note, transaction });

		
		if (result === "discovered") {
			petition_APT_button.mode ("success", {
				note
			});
		}
		else {
			petition_APT_button.mode ("imperfection", {
				note
			});
		}
	}
	catch (imperfection) {
		console.error ("imperfection:", imperfection)
		petition_APT_button.mode ("imperfection", {
			note: "A problem occurred while processing the transfer."
		});
	}
};

const end = () => {
	
};

</script>

<Sport_Pack_Ride on_change={ ({ pro_freight }) => { Sport_Pack_Freight = pro_freight; } } />
<Extension_Winch_Ride on_change={ ({ pro_freight }) => { EWF = pro_freight; } } />
{#if typeof Sport_Pack_Freight === "object" && typeof EWF === "object"}
<div
	style="
		display: flex;
		gap: 0.1cm;
		flex-direction: column;
	"
>
	<div class="card p-4"
		style="
			width: 100%;
			text-align: center;
			
			display: flex;
			justify-content: center;
			gap: 0.25cm;
			align-items: flex-end;
			
			
		"
	>
		<label class="label">
			<span>Planet IV Units</span>
			<input 
				bind:value={ Planet_IV_Units }
				style="
					text-indent: 0.0cm;
					max-width: 10cm;
					padding: 0.1cm 0.25cm;
				"
				class="input" 
				type="number" 
				placeholder="Planet IV Units" 
			/>
		</label>
	
		<Petition_APT_Button
			button_text="Begin"
			APT="0"
			clicked={ begin }
			
			permitted={ "yes" }
		/>
	</div>
	
	
	<div class="card p-4"
		style="
			width: 100%;
			text-align: center;
			
			display: flex;
			justify-content: space-around;
		"
	>
		<Petition_APT_Button
			button_text="End"
			APT="0"
			clicked={ end }
			
			permitted={ "yes" }
		/>
	</div>
	
	<div class="card p-4"
		style="
			width: 100%;
			text-align: center;
		"
	>

	</div>
</div>
{/if}
