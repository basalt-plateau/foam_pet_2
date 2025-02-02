

<script>


/*
	This shows the venue.
*/

/*	
	Important:
		Navigator
		Scholars_Truck
*/

/*
	Wonder ({
		path: './Venues/Talents/Trinket.svelte',
		
		
	})
*/




import { onMount, onDestroy } from 'svelte'

import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
import { parse_styles } from '$lib/trinkets/styles/parse'
	
import { technicians_leaves } from './Venues/Vows/Leaves.js'

/*
	//
	//	status:
	//		here
	//		importing
	//		there
	//
	
	
	Wonder ({
		obtain: async () => { return await import ('./Venues/Scholars/Hints/Trinket.svelte') }
	}) 
*/
const Wonder = ({ obtain, spot }) => {
	// async () => { return await import ('./Venues/Talents/Trinket.svelte') }
	
	return {
		obtain: async () => { return await import ('./Venues/Scholars/Hints/Trinket.svelte') },
		status: "there"
	}
}

let Milieus = {
	"Ecology": {
		"Hints": async () => { return await import ('./Venues/Scholars/Hints/Trinket.svelte') },
	},
	
	"Vows": technicians_leaves,
	
	"Talents": async () => { return await import ('./Venues/Talents/Trinket.svelte') },
	"Wallet": async () => { return await import ('$lib/Les_Talents/_Wallet/Leaf/Board.svelte') },
	
	"Bourgeoisie": async () => { return await import ('$lib/Bourgeoisie/Trinket.svelte') },
}

let milieu_venue;

let location = []
// let component = Milieus [ "Ecology" ] [ "Hints" ]
let component;

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
		next_component = (await Milieus [ "Ecology" ] [ "Hints" ] ()).default;
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
	monitor="milieus tome"
	bind:this={ milieu_venue }
	style={ style }
>	
	<Milieus_Truck on_change={ on_Milieus_truck_change } />
	
	{#if Milieus_truck_prepared === "yes" }
	<svelte:component this={ component } />
	{/if}
</div>
