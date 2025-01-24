

<script>

////
//
import Polytope_2 from '$lib/trinkets/Polytope_2/Tome.svelte'
import * as Extension_Winch from "$lib/Singles/Extension_Winch"	
//
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import Caution_Alert from '$lib/trinkets/Alerts/Caution.svelte'
import Address_Qualities_Trinket from '$lib/trinkets/Address_Qualities/Trinket.svelte'
import Amount_Field from '$lib/trinkets/Amount_Field/Trinket.svelte'
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'
//
//
import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'
import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"
import { find_transaction_by_hash_loop } from '$lib/PTO/Transaction/find_by_hash_loop'
//
////



let origin_address_trinket;

////
//
//	Amount Field
//
let amount_field = ""
let amount_of_octas = ""
let amount_field_effects = {};
const on_amount_change = ({ 
	effects,
	actual_amount_of_Octas
}) => {
	amount_field_effects = effects;
	if (effects.problem === "") {
		amount_of_octas = actual_amount_of_Octas;
	}
	
	console.log ("on amount change");
	go_over_the_rules ();
}
const on_amount_prepare = () => {
	amount_field.modify ({ Octas: "0" });
	go_over_the_rules ();
}
//
////


////
//
// To Address
//
//
let to_address_trinket = "";
let to_address = {
	effective: "no",
	address_hexadecimal_string: "",
	exception: ""
};
const on_prepare = () => {
	to_address_trinket.change_address_hexadecimal_string ("");
	go_over_the_rules ();
};
const on_change = ({
	effective,
	address_hexadecimal_string,
	exception
}) => {
	let previous_address_hexadecimal_string = to_address.address_hexadecimal_string;
	
	to_address.effective = effective;
	to_address.address_hexadecimal_string = address_hexadecimal_string;
	to_address.exception = exception;
	
	console.trace ("on_change to address");
	
	if (previous_address_hexadecimal_string !== address_hexadecimal_string) {
		go_over_the_rules ();
	}
};
//
////

let can_transfer = "no"
let caution_alert = "";
let rule_problem = "";
const go_over_the_rules = () => {
	console.info ("go_over_the_rules");
	
	rule_problem = "";
	caution_alert = "";
	
	if (typeof petition_APT_button !== "object") {
		rule_problem = `Problem; The petition APT button has not been initialized.`;
		return;
	}
	
	petition_APT_button.mode ("off");
	
	// to address vow
	if (address_to_hexadecimal (to_address.address_hexadecimal_string).length === 0) {
		rule_problem = `Problem; The "To Address" has 0 digits.`;
		return;
	}
	
	try {
		if (to_address.exception !== "") {
			rule_problem = to_address.exception;
			return;
		}
	}
	catch (imperfection) {
		console.error (imperfection);
		rule_problem = `Problem; The "To Address" could not be verified.`;
		return;
	}
	
	// amount vow
	try {
		assert_is_natural_numeral_string (amount_of_octas);
	}
	catch (imperfection) {
		rule_problem = `Problem; The "Amount of Octas" is not a natural number.`;
		return;
	}
	
	try {
		if (amount_field_effects.problem !== "") {
			rule_problem = amount_field_effects.problem;
			return;
		}
	}
	catch (imperfection) {
		rule_problem = `Problem; The "Amount of Octas" could not be verified.`;
		return;
	}
	
	try {
		if (amount_of_octas === "0") {
			rule_problem = `Problem; "Amount of Octas" should be greater than zero.`;
			return;
		}
	}
	catch (imperfection) {
		rule_problem = `Problem; The "Amount of Octas" could not be verified.`;
		return;
	}
	
	////
	//
	//	Cautions
	//
	//
	if (address_to_hexadecimal (to_address.address_hexadecimal_string).length < 64) {
		caution_alert = `Caution; The "To Address" has less than 64 digits.`;
	}
	
	
	petition_APT_button.mode ("on");
}

	
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
		>APT Transfer</header>
		
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
		
		{#if rule_problem.length >= 1 }
		<Problem_Alert text={ rule_problem } />
		{/if}
		
		{#if caution_alert.length >= 1 }
		<Caution_Alert 
			text={ caution_alert }
			progress={{ show: "yes" }}
		/>
		{/if}
		
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
			
				onMount={() => {
					
				}}
			/>
		</div>
	</div>
	{:else}
	<Problem_Alert 
		text={ "There isn't a wallet connected." }
	/>
	{/if}
	{/if}
	
	<div style="height: 5cm;" />
</div>