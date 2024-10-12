

<script>

/*
	import Slang from '$lib/trinkets/Slang/Trinket.svelte'
	<Slang text="transaction" />
*/

/*
	Currently supports replacing 1 or 2 word sayings.
*/

/*
	@ Legend
		@ Vernacular
		@ Jargon
*/

/*
	Decipher Aristocratic English into Regular English.
*/

////
//
import { has_field } from '$lib/taverns/procedures/object/has_field'
import { onMount, onDestroy } from 'svelte'
import nlp from 'compromise/one'
//
//
import { check_roomies_truck, monitor_roomies_truck } from '$lib/Versies/Trucks'
//
//
import { nocturnalize } from './screenplays/nocturnalize'
import { American_1 } from './jargons/American_1'
//
////

const language = "English"
const legend = {
	"Chinese": {},
	"Francais": {},
	"Spanish": {},
	
	"English": American_1,
}

// let legendary = legend [ language ] [ text ]
let legend_language = legend [ language ]

var built = []

////
//
export let style = ""
export let text = ""
export let reveal = "yes"
export let badge = "yes"
$: {
	let _text = text;
	build ();
}
//
////

let actual_styles = ``;

let use_slang;
const build = () => {
	
	
	try {
		if (Seeds_Trucks_Freight && has_field (Seeds_Trucks_Freight, "use_slang")) {
			if (use_slang !== Seeds_Trucks_Freight.use_slang) {
				use_slang = Seeds_Trucks_Freight.use_slang;
				
				if (use_slang === "yes") {
					built = nocturnalize ({ legend_language, text })
				}
				else {
					built = nocturnalize ({ legend_language, text, slang: "no" })
				}
			}
		}
		
	}
	catch (exception) {
		console.error (exception)
	}
	
	actual_styles = build_styles ();
}


let Seeds_Trucks_Prepared = "no"
let Seeds_Trucks_Monitor;
let Seeds_Trucks_Freight;
onMount (async () => {
	const Truck = check_roomies_truck ()
	Seeds_Trucks_Freight = Truck.freight; 
	
	Seeds_Trucks_Monitor = monitor_roomies_truck ((_freight) => {
		Seeds_Trucks_Freight = _freight;
		
		if (use_slang !== Seeds_Trucks_Freight.use_slang) {
			build ()
		}	
	})
	
	build ()
	
	Seeds_Trucks_Prepared = "yes"
});

onDestroy (() => {
	Seeds_Trucks_Monitor.stop ()
}); 


const build_styles = () => {
	let actual_styles = `
		display: inline-block;
		
		color: inherit;
		
		font-size: 1em;
		white-space: break-spaces;
		
		transition: .75s transform, width .5s;
		transform: rotateX(0deg);
	`;

	if (use_slang === "yes") {
		actual_styles += `
			cursor: pointer;
		`;
	}

	// console.log ({ use_slang });

	if (badge === "yes") {
		actual_styles += `
			font-weight: bold;
			padding: 0.3em;
			border: 2px solid rgb(var(--color-primary-500) / 0.1);
			background: rgb(var(--color-primary-500) / 0.1);
			border-radius: 10px;
		`
	}
	else {
		actual_styles += `
			background: none;
		`
	}

	actual_styles += style;

	return actual_styles;
}

actual_styles = build_styles ();


let timeout_1;
let timeout_2;
let timeout_3;
let reveal_slang = ({ element, text, original }) => {
	if (use_slang === "yes" && reveal === "yes") {
		console.log ("reveal_slang", { element });
		
		clearTimeout (timeout_1)
		clearTimeout (timeout_2)
		clearTimeout (timeout_3)
		
		element.style.transform = 'rotateX(360deg)';
		
		timeout_1 = setTimeout (() => {
			element.textContent = original;
		}, 250)
		
		timeout_2 = setTimeout (() => {
			element.style.transform = 'rotateX(0deg)';
		}, 2000)
		
		timeout_3 = setTimeout (() => {
			element.textContent = text;
		}, 2250)
	}
}

</script>




<span>
	{#each built as part }
	{#if part.code === "yes"}
		<span><code
			class="code"
			style={ actual_styles }
			
			on:click={(event) => { 
				reveal_slang ({ 
					element: event.target, 
					original: part.original,
					text: part.text 
				})
			}}
		>{ part.text }</code></span>
	{:else}
		<span>{ part.text }</span>
	{/if}
	{/each}
</span>
