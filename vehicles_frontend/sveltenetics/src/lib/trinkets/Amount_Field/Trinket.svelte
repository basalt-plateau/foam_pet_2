


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

////
//
import { onMount, onDestroy } from 'svelte';
import Big from 'big.js'
//
import { has_field } from '$lib/taverns/procedures/object/has_field'
//
//
import { build_truck } from '$lib/trucks'
//
import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'
import Alert_Info from '$lib/trinkets/Alerts/Info.svelte'
//
import { ask_convert_APT_to_Octas } from '$lib/taverns/APT/APT_to_Octas.js'
import { ask_convert_Octas_to_APT } from '$lib/taverns/APT/Octas_to_APT.js'
import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'
import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'
import { remove_leading_zeroes } from '$lib/taverns/numerals/remove_leading_zeroes.js'
//
//
import { Octas_string_is_permitted } from './Screenplays/Octas_string_is_permitted.js'
//
////

export let on_change = () => {}
export let on_prepare = () => {}

export let display_sci_note_estimate = "no"

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



const change_amount = ({ Octas }) => {
	console.log ("change_amount:", { Octas });
	
	assert_is_natural_numeral_string (Octas);
	actual_amount_of_Octas = remove_leading_zeroes ({ Digits: Octas });;
	
	effects.problem = ``
	
	on_change ({
		effects,
		actual_amount_of_Octas,
		
		amount,
		currency
	})
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
			const Octas_as_string = await ask_convert_APT_to_Octas ({ 
				APT: amount.toString ()
			});
			change_amount ({ Octas: Octas_as_string });
			return;
		}
		else if (currency === "Octas") {
			const Octas_as_string = amount.toString ();
			change_amount ({ Octas: Octas_as_string });
			return;
		}
		else {
			effects.problem = `Currency "${currency}" was not accounted for.`
		}
	}
	catch (exception) {
		if (amount.length !== 0) {
			console.error (exception);
		}
		
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
	prepared = "yes"
	await on_prepare ();
})


	
export const modify = ({ Octas }) => {
	if (currency === "APT") {
		const APT = ask_convert_Octas_to_APT ({ Octas })
		amount = APT
	}
	else {
		amount = Octas;
	}
	
	change_amount ({ Octas });
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
	<div>
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
			_class="input-group input-group-divider grid-cols-[auto_1fr_auto]"
			style="
				padding: 2px;
				display: flex;
			"
		>
			<label 
				class="label"
				style="
					width: 100%;
				"
			>
				<input 
					monitor="amount field"
					amount_field
					
					bind:value={ amount }
					on:keyup={ amount_field_on_key_up }
					
					style="padding: 10px 20px; text-align: right;"
					class="input" 
					
					type="text" 
					placeholder={ placeholder }
				/>
			</label>

			<label 
				style="
					width: 3cm;
					border-radius: 8px;
					text-align: center;
					
					margin-left: 0.1cm;
				"
				class="label"
			>
				<select 
					monitor="currency chooser"
					currency_chooser
				
					bind:value={ currency }
					
					style="
						height: 100%;
						width: 100%;
					"
					class="select"
				>
					<option>APT</option>
					<option>Octas</option>
				</select>
			</label>
		</div>
	</div>

	
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
		{#if display_sci_note_estimate === "yes" }
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
		{/if}
		
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
	
	{#if effects.problem.length >= 1 }
	<Problem_Alert 
		text={ effects.problem }
	/>
	{/if}
</div>
{/if}