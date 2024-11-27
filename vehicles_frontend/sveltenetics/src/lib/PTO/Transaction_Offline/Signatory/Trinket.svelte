

<script>

/*
	TODO:
	
		import Offline_Petition from '$lib/PTO/Transaction_Offline/Petition/Trinket.svelte'
		<Offline_Petition 
			begin_at_bracket="yes"
		/>
		
		// somehow call function in Component
		OP.use_fields ({
			
		})
*/

/*
	lib/Milieus/Venues/Scholars/Resilience/Adaptation Prebuilt
*/

/*
	Panels:
		Petition Form
		Petition Verification
		Petition Send
		Signature Reader
		Signature Verification
		Adaptation Suggestion
*/

////
//
import { onMount, onDestroy } from 'svelte';
import { Paginator } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';	
//
//
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
//
//
////

import Versies_Truck from '$lib/Versies/Trucks.svelte'
import Signatory_Truck from './Truck/Ride.svelte'
import * as ST from './Truck/index.js'




let ST_Freight = false;
$: {
	let _ST_Freight = ST_Freight;
}

let Versies_Freight = false;
$: {
	let _Versies_Freight = Versies_Freight;
}
	
let build_petition = () => {	
	

	
}

let le_buttons = [ 1,2,3,4,5,6 ]

let ST_prepared = "no"
onMount (async () => {	
	ST.make_truck ()
	

	ST_prepared = "yes"
});
onDestroy (() => {
	ST.destroy_truck ()
});

</script>

{#if ST_prepared === "yes" }
<div 
	style="
		position: relative;
		height: 100%;
		width: 100%;
	"
	class="card"
>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	<Signatory_Truck on_change={ ({ pro_freight }) => { ST_Freight = pro_freight; } } />

	{#if typeof ST_Freight === "object" && typeof Versies_Freight === "object"}

	{/if}
</div>
{/if}