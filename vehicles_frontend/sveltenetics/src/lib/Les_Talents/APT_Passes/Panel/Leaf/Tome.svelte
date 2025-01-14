

<script>

////
//
//
import Polytope_2 from '$lib/trinkets/Polytope_2/Tome.svelte'
import * as Extension_Winch from "$lib/Singles/Extension_Winch"	
//
////
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import Address_Qualities_Trinket from '$lib/trinkets/Address_Qualities/Trinket.svelte'
import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'
import { find_transaction_by_hash_loop } from '$lib/PTO/Transaction/find_by_hash_loop'
import Amount_Field from '$lib/trinkets/Amount_Field/Trinket.svelte'


let origin_address_trinket;

////
//
//	Amount Field
//
let amount_field = ""
let amount_of_octas = ""
const on_amount_change = ({ 
	effects,
	actual_amount_of_Octas
}) => {
	console.log ("on_amount_change", actual_amount_of_Octas)
	
	// freight.fields.actual_amount_of_Octas_problem = effects.problem;
	
	if (effects.problem === "") {
		amount_of_octas = actual_amount_of_Octas;
	}
}
const on_amount_prepare = () => {
	amount_field.modify ({ 
		Octas: "0"
	})
}
//
////



//
// This is for electing the original value of the trinket.
//
//
let to_address_trinket = "";
let to_address = {
	effective: "no",
	address_hexadecimal_string: "",
	exception: ""
};
const on_prepare = () => {
	to_address_trinket.change_address_hexadecimal_string ("")
};
const on_change = ({
	effective,
	address_hexadecimal_string,
	exception
}) => {
	to_address.effective = effective;
	to_address.address_hexadecimal_string = address_hexadecimal_string;
	to_address.exception = exception;
};

	
let polytope_modal;
let petition_APT_button = "";

let to = "";
let amount = ""
const transfer = async () => {
	// const origin_address = Extension_Winch.freight ().propose_for_account_address ();
	
	/*
		2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD
		'0x1::aptos_coin::AptosCoin'
	*/
	const EWF = Extension_Winch.freight ();
	
	
	petition_APT_button.mode ("progress");
	
	/*
	petition_APT_button.mode ("success", {
		note: "was successful"
	});
	petition_APT_button.mode ("imperfection", {
		note: "imperfection"
	});
	*/
	
	try {
		const { result, note, transaction } = await EWF.prompt ({
			petition: {
				function: '0x1::aptos_account::transfer',
				type_arguments: [],
				arguments: [
					to_address.address_hexadecimal_string,
					amount_of_octas
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
	
	
	
}

import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
let Extension_Winch_Freight = false

	

</script>


<div
	style="
		box-sizing: border-box;
		height: 100%;
		width: 100%;
		
		padding: 1cm;
	"
>
	<Extension_Winch_Ride on_change={ ({ pro_freight }) => { Extension_Winch_Freight = pro_freight; } } />
	{#if typeof Extension_Winch_Freight === "object" }
	{#if Extension_Winch_Freight.stage_name_connected.length >= 1 }
	<div 
		style="
			width: 100%;
		"
	>
		<header
			style="
				font-size: 1.5em;
				text-align: center;
			"
		>Transfer APT</header>
		
		<div 
			style="
				width: 100%;
			"
			class="card p-4"
		>
			<Address_Qualities_Trinket 
				name="Origin Address"

				bind:this={ origin_address_trinket }
				
				has_field="no"
				
				on_change={({
					effective,
					address_hexadecimal_string,
					exception
				}) => {}}
				on_prepare={() => {
					const address = Extension_Winch.freight ().propose_for_account_address ();
					console.info ({ address });
					
					origin_address_trinket.change_address_hexadecimal_string (address)
				}}
			/>
		</div>

		<div style="height: 0.25cm" />


		<div 
			style="
				width: 100%;
			"
			class="card p-4"
		>
			<Address_Qualities_Trinket 
				name="To Address"
			
				bind:this={ to_address_trinket }
				
				on_change={ on_change }
				on_prepare={ on_prepare }
			/>
		</div>
		
		<div style="height: 0.25cm" />
		
		<div class="card variant-soft-primary p-4" style="color: inherit">
			<div style="text-align: center;">
				<span 
					class="badge variant-soft-primary" 
					style="
						margin: 0 auto;
						padding: 0.2cm 1cm;
					"
				>
					<p style="font-size: 1.2em; font-weight: bold;">Amount</p>
				</span>
			</div>
			
			<p
				style="text-align: center; padding-bottom: 10px"
			>1 APT = 1e8 Octas</p>
			
			<Amount_Field 
				bind:this={ amount_field }
				on_change={ on_amount_change }
				on_prepare={ on_amount_prepare }			
			/>
		</div>
		
		
		<div
			style="
				display: flex;
				justify-content: right;
				align-items: center;
				gap: 0.25cm;
				
				padding: 0.25cm 0;
			"
		>
			<Petition_APT_Button
				bind:this={ petition_APT_button }
			
				button_text="Transfer"
				
				APT="0"
				clicked={ transfer }
			
				permitted={ "yes" }
			/>
		</div>
	</div>
	{:else}
	<Problem_Alert 
		text={ "There isn't a wallet connected." }
	/>
	{/if}
	{/if}
</div>