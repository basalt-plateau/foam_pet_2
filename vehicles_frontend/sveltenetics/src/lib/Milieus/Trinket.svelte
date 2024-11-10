

<script>


/*
	This shows the venue.
*/

/*	
	Important:
		Navigator
		Scholars_Truck
*/


import { onMount, onDestroy } from 'svelte'

import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
import { parse_styles } from '$lib/trinkets/styles/parse'
	
let Milieus = {
	"Scholars": {
		"Hints": async () => { return await import ('./Venues/Scholars/Hints/Trinket.svelte') },
		"Garden": async () => { return await import ('./Venues/Scholars/Garden/Trinket.svelte') },
		"Theme": async () => { return await import ('./Venues/Scholars/Theme/Trinket.svelte') },
	},
	"Friends": {
		"Talents": async () => { return await import ('./Venues/Friends/Talents/Trinket.svelte') }
	},
	"Loyals": {
		"Hints": async () => { return await import ('./Venues/Loyals/Hints/Trinket.svelte') },
		"Accounts": async () => { return await import ('./Venues/Loyals/Players/Trinket.svelte') },
		"Signatures": async () => { return await import ('./Venues/Loyals/Flourishes/Trinket.svelte') }
	},
	"Technicians": {
		"Map": async () => { return await import ('./Venues/Technicians/Trinket.svelte') },
		
		"Address Qualities": async () => { return await import ('./Venues/Technicians/Address_Qualities/Trinket.svelte') },
		"Address Qualities with Address": async () => { return await import ('./Venues/Technicians/Address_Qualities_with_Address/Trinket.svelte') },
		"Amount Field": async () => { return await import ('./Venues/Technicians/Amount_Field/Trinket.svelte') },		
		"Consensus Transactions": async () => { return await import ('./Venues/Technicians/Consensus_Transactions/Trinket.svelte') },		
		"Hone Focus": async () => { return await import ('./Venues/Technicians/Hone_Focus/Trinket.svelte') },
		"Net Choices with Text": async () => { return await import ('./Venues/Technicians/Net_Choices_with_Text/Trinket.svelte') },		
		"Net Choices": async () => { return await import ('./Venues/Technicians/Nets_Choices/Trinket.svelte') },		
		"Polytope": async () => { return await import ('./Venues/Technicians/Polytope/Trinket.svelte') },		
		"Slang": async () => { return await import ('./Venues/Technicians/Slang/Trinket.svelte') },
		
		"Field": async () => { return await import ('./Venues/Technicians/Field/Trinket.svelte') },
	}
}

let milieu_venue;

let location = []
let component = Milieus [ "Scholars" ] [ "Hints" ]

let style = parse_styles ({
	opacity: 1,
	transition: "opacity .1s"
})

let Milieus_freight = {}
let Milieus_truck_prepared = "no"
const on_Milieus_truck_change = async ({ freight: _freight, happening }) => {
	Milieus_freight = _freight;
	
	
	const location = Milieus_freight.location;
	console.log ("Milieus Location:", location [0], location [1])


	
	if (happening !== "mounted") {
		milieu_venue.style.opacity = 0;
	}
	
	let next_component;
	try {
		next_component = (await Milieus [ location [0] ] [ location [1] ] ()).default;
	}
	catch (exception) {
		console.error (exception)
		next_component = (await Milieus [ "Scholars" ] [ "Hints" ] ()).default;
	}
	
	
	await new Promise (resolve => {
		setTimeout (() => { 
			resolve ();
		}, 100);			
	});
	
	component = next_component;
	
	milieu_venue.style.opacity = 1;
	
	if (happening === "mounted") {
		Milieus_truck_prepared = "yes"
	}
}




</script>



<div
	bind:this={ milieu_venue }

	style={ style }
>	
	<Milieus_Truck on_change={ on_Milieus_truck_change } />
	
	{#if Milieus_truck_prepared === "yes" }
	<svelte:component this={ component } />
	{/if}
</div>
