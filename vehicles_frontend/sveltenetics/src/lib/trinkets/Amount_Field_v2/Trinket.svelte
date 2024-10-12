


<script>

/*	
	import Amount_Field from '$lib/trinkets/Amount_Field/Trinket.svelte'
	
	
	let amount_field = ""
	
	const on_amount_change = ({ 
		effects,
		actual_amount_of_Octas
	}) => {
		if (effects.problems === "") {
			
		}
	}
	
	const on_amount_prepare = () => {
		amount_field.modify_octas ();
	}
	
	<Amount_Field 
		bind:this={ amount_field }
		on_change={ on_amount_change }
		on_prepare={ on_amount_prepare }
	/>
*/

//\
//
import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'
//
import { onMount, onDestroy } from 'svelte';
import Big from 'big.js'
import { Octas_string_is_permitted } from './Screenplays/Octas_string_is_permitted.js'
//
import { has_field } from '$lib/taverns/procedures/object/has_field'
//
///
import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'
import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'
import Alert_Info from '$lib/trinkets/Alerts/Info.svelte'

import { ask_convert_APT_to_Octas } from '$lib/taverns/APT/APT_to_Octas.js'
import { ask_convert_Octas_to_APT } from '$lib/taverns/APT/Octas_to_APT.js'
	

export let on_change = () => {}
export let after_mount = () => {}

import { build_truck } from '$lib/trucks'
const trucks = {}

const placeholders = Object.freeze ({
	"APT": "Amount of APT",
	"Octas": "Amount of Octas"
})

$: amount = ""
$: currency = "APT"
$: placeholder = placeholders ["Octas"]
$: actual_amount_of_Octas = ""



let effects = {
	sci_note_estimate_of_Octas: "",	
	problem: ""
}

$: {
	let _amount = amount;
	console.log ("amount changed")
	effect_change ()
}
$: {
	let _currency = currency;
	console.log ("currency changed")
	effect_change ()
}
$: {
	let _actual_amount_of_Octas = actual_amount_of_Octas;
	calculate_exponent ()
}

const Octas_from_APT = async () => {
	let proceeds = ""
	
	try {
		const Octas = await ask_convert_APT_to_Octas ({ 
			APT: amount.toString ()
		})
		actual_amount_of_Octas = Octas;
		effects.problem = ``
		on_change ({
			effects,
			actual_amount_of_Octas,
			
			amount,
			currency
		})
		return;
	}
	catch (exception) {
		effects.problem = exception.message;
	}
	
	actual_amount_of_Octas = ""
	on_change ({
		effects,
		actual_amount_of_Octas,
		
		amount,
		currency
	})
}


const change_amount = () => {
	
}


let first_input_occurred = "no"
const amount_field_on_key_up = () => {
	first_input_occurred = "yes"
}


const effect_change = async () => {
	effects.problem = ""
	actual_amount_of_Octas = "" 
	
	placeholder = placeholders [ currency ]
	
	try {
		if (currency === "APT") {
			await Octas_from_APT ();				
			return;
		}
		else if (currency === "Octas") {
			const Octas_as_string = amount.toString ();
			assert_is_natural_numeral_string (Octas_as_string);
			
			actual_amount_of_Octas = Octas_as_string;
			effects.problem = ``
			on_change ({
				effects,
				actual_amount_of_Octas,
				
				amount,
				currency
			})
			return;
		}
		else {
			effects.problem = `Currency "${currency}" was not accounted for.`
		}
	}
	catch (exception) {
		effects.problem = exception.message;
	}
	
	on_change ({
		effects,
		actual_amount_of_Octas,
		
		amount,
		currency
	})
}

let prepared = "no"
onMount (async () => {
	await after_mount ();
	
	// effect_change ()
	
	prepared = "yes"
})

export const modify_octas = () => {
	console.log ("modify_octas");
	
	const APT = ask_convert_Octas_to_APT ({ Octas: "1" })
	console.log ("modify_octas", { APT });
}


onDestroy (() => {})

const calculate_exponent = () => {1
	try {
		let exponent = parseFloat (actual_amount_of_Octas).toExponential () 
		if (exponent === "NaN") {
			return ""
		}
		
		return exponent;
	}
	catch (exception) {
		console.error (exception)
	}

	return ""
}



</script>

{#if prepared === "yes"}
<div>
	<label class="label">
		<aside class="alert variant-filled-warning">
			<div class="alert-message"
				style="
					text-align: center;
				"
			>
				<p><b>Caution</b>, Please make sure "<b>Actual Amount</b>" is the intended amount.
				<p>It's calculated from the number provided and is the amount used.</p>
			</div>
		</aside>
		
		<div 
			class="input-group input-group-divider grid-cols-[auto_1fr_auto]"
			style="padding: 2px"
		>
			<select 
				currency_chooser
			
				bind:value={ currency }
				
				class="input-group-shim"
				style="
					width: 100px;
					border-top-left-radius: 20px;
					border-bottom-left-radius: 20px;	
					text-align: center;
				"
			>
				<option>APT</option>
				<option>Octas</option>
			</select>
			<input 
				amount_field
				
				bind:value={ amount }
				
				on:keyup={ amount_field_on_key_up }
				
				style="padding: 10px; border: 0"
				class="input" 
				
				type="text" 
				placeholder={ placeholder }
			/>
		</div>
	</label>

	
	<div
		style="

			
			// display: flex;
			// flex-wrap: wrap;
			// justify-content: space-between;
			// flex-direction: wrap;
			
			width: 100%;
			margin: 4px 0;
		"
	>
		<span 
			class="badge variant-soft"
			style="
				// display: grid;
				// grid-template-columns: repeat(auto-fit, minmax(6cm, 1fr));
				// gap: 4px;
				
				// flex: 1 1 50%;
				
				display: flex;
				flex-wrap: wrap;
				justify-content: space-between;
			
				position: relative;
				font-size: 1.2em;
				white-space: break-spaces;
				padding: 0.25cm 0.5cm;
			"
		>
			<span>Sci Note Estimate</span>
			<div>
				<span 
					style="
						font-size: 1em;
						white-space: preserve;
						word-wrap: anywhere;
						margin: 4px;
					"
				>{ calculate_exponent (actual_amount_of_Octas) }</span>
				<span 
					class="badge variant-filled-surface"
					style="
						font-size: 1.1em;
					"
				>Octas</span>
			</div>
		</span>
		
		<div style="height: 6px; width: 6px"></div>
		
		<span 
			class="badge variant-soft"
			style="
				// display: grid;
				// grid-template-columns: repeat(auto-fit, minmax(6cm, 1fr));
				// gap: 4px;
				
				// flex: 1 1 50%;
				
				display: flex;
				flex-wrap: wrap;
				justify-content: space-between;
			
				position: relative;
				font-size: 1.2em;
				white-space: break-spaces;
				padding: 0.25cm 0.5cm;
			"
		>
			<span><b>Actual Amount</b></span>
			<div>
				<span 
					monitor="actual amount of octas"
					style="
						font-size: 1em;
						white-space: preserve;
						word-wrap: anywhere;
						margin: 4px;
					"
				>{ parse_with_commas (actual_amount_of_Octas) }</span>
				<span 
					class="badge variant-filled-surface"
					style="
						font-size: 1.1em;
					"
				>Octas</span>
			</div>
		</span>
	</div>
	
	{#if first_input_occurred === "no" }
	<Alert_Info 
		text="Waiting for amount"
		progress={{
			show: "yes"
		}}
	/>
	{/if}
	
	{#if effects.problem.length >= 1 && first_input_occurred === "yes" }
	<Problem_Alert 
		text={ effects.problem }
	/>
	{/if}
</div>
{/if}