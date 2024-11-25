

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
	
import { technicians_leaves } from './Venues/Scholars/Resilience/Leaves.js'
	
let Milieus = {
	"Scholars": {
		"Hints": async () => { return await import ('./Venues/Scholars/Hints/Trinket.svelte') },
		"Garden": async () => { return await import ('./Venues/Scholars/Garden/Trinket.svelte') },
		"Theme": async () => { return await import ('./Venues/Scholars/Theme/Trinket.svelte') },
		"Resilience": technicians_leaves
	},
	"Talents": async () => { return await import ('./Venues/Friends/Talents/Trinket.svelte') },
	
	/*"Friends": {
		"Talents": async () => { return await import ('./Venues/Friends/Talents/Trinket.svelte') }
	},*/
	
	"Loyals": {
		"Hints": async () => { return await import ('./Venues/Loyals/Hints/Trinket.svelte') },
		"Accounts": async () => { return await import ('./Venues/Loyals/Players/Trinket.svelte') },
		"Signatures": async () => { return await import ('./Venues/Loyals/Flourishes/Trinket.svelte') }
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
	console.log ("on_Milieus_truck_change:", { location });
	
	if (happening !== "mounted") {
		milieu_venue.style.opacity = 0;
	}

	let next_component;
	if (location.length == 3) {
		next_component = (
			await Milieus [ location [0] ] [ location [1] ] [ location [2] ] ()
		).default;
	}
	else if (location.length == 2) {
		next_component = (await Milieus [ location [0] ] [ location [1] ] ()).default;
	}
	else if (location.length == 1) {
		next_component = (await Milieus [ location [0] ] ()).default;
	}
	else {
		console.error ("Location was not accounted for:", { location })
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
