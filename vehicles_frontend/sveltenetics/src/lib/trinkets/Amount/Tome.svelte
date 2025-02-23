


<script>

/*	
	import Amount_Tome from '$lib/trinkets/Amount/Tome.svelte'
	
	let amount_field = ""
	<Amount_Tome 
		bind:this={ amount_field }
		on_change={({ 
			effects,
			actual_amount_of_Octas
		}) => {
			if (effects.problems === "") {
				
			}
		}}
		on_amount_prepare={() => {
			amount_field.modify_octas ();
		}}
	/>
*/

////
//
import { onMount, onDestroy } from 'svelte';
//
import { has_field } from '$lib/taverns/procedures/object/has_field'
//
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
	
	
	{#if effects.problem.length >= 1 }
	<Problem_Alert 
		text={ effects.problem }
	/>
	{/if}
</div>
{/if}