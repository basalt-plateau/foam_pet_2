

<script>

/*
	import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'

	<Milieus_Button
		name={ "Talents" }
		location={[ "Friends", "Talents" ]}
		is_open_location={[ "Friends" ]}
	/>
*/

/*
	import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'

	<Milieus_Button
		name={ "Talents" }
		location={[ "Friends", "Talents" ]}
		component=""
	/>
*/

import { onMount, onDestroy } from 'svelte'
import { check_Milieus_truck, monitor_Milieus_truck } from '$lib/Milieus/Truck'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
	

export let monitor = ""

export let scroll_to_top = "yes"
export let name = ""
export let location = [ "", "" ]
export let is_open_location = []
export let component = ""
export let style = ""
export let fresh_panel = "no"

export let component_props = {}
$: {
	let _component_props = component_props;
}


let actual_style = `
	padding: 0.1cm 0.25cm;
	box-shadow: 0 0 0px 2px rgb(var(--color-surface-500));
	font-size: 1em;
` + style;
$: {
	actual_style = `
		padding: 0.1cm 0.25cm;
		box-shadow: 0 0 0px 2px rgb(var(--color-surface-500));
		font-size: 1em;
	` + style;
}

let actual_monitor = ""
if (monitor.length === 0) {
	actual_monitor = name;
}
else {
	actual_monitor = monitor;
}


let is_open = "no"
let check_is_open = () => {
	for (let E = 0; E < is_open_location.length; E++) {
		if (is_open_location [E] !== Scholars_Trucks_Freight.location [E]) {
			is_open = "no"
			return;
		}
	}
	
	is_open = "yes";
}


let Scholars_Trucks_Prepared = "no"
let Scholars_Trucks_Monitor;
let Scholars_Trucks_Freight;
onMount (async () => {
	const Truck = check_Milieus_truck ()
	Scholars_Trucks_Freight = Truck.freight; 
	
	Scholars_Trucks_Monitor = monitor_Milieus_truck ((_freight) => {
		Scholars_Trucks_Freight = _freight;
		check_is_open ();
	})
	
	check_is_open ();
	Scholars_Trucks_Prepared = "yes"
});

onDestroy (() => {
	Scholars_Trucks_Monitor.stop ()
}); 






let button_tapped = () => {
	console.log ("button_tapped:", location [0], location [1])

	/*
		TODO:
			This should open to a session storage location.
	*/
	if (fresh_panel === "yes") {
		const panel = window.open ("/", '_blank');
		panel.onload = function() {
			panel.sessionStorage.setItem ('location', 'value');
			console.log ({ panel });
		};
		return;
	}
	
	Scholars_Trucks_Freight.location = [ 
		location [0],
		location [1]
	]
	
	if (scroll_to_top === "yes") {
		//window.scrollTo ({ top: 0, behavior: 'smooth' });
		window.scrollTo ({ top: 0 });
	}
}

let tapped = "variant-filled"
// let untapped = "bg-gradient-to-br variant-gradient-primary-secondary"
let untapped = "variant-filled-primary"




</script>


<style>

@media (max-width: 800px) {
	.navigator-button {
		padding: 0.1cm 0.25cm;
		margin: 0 0.05cm;
	}
}

</style>

{#if Scholars_Trucks_Prepared === "yes"}
<button 
	monitor={ actual_monitor }

	on:click={ button_tapped (name) }
	type="button" 
	
	style={ actual_style }
	
	class={
		`navigator-button btn ${ 
			is_open === "yes" ? tapped : untapped
		}`
	}
>
	{#if typeof component === "function" }
	<svelte:component this={ component } {...component_props} />
	{:else}
	<Slang 
		text={ name } 
		reveal={ "no" }
		badge={ "no" }
	/>
	{/if}
</button>
{/if}