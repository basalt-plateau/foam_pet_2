

<script>

/*
	import Offline_Petition from '$lib/PTO/Transaction_Offline/Petition/Trinket.svelte'
	<Offline_Petition />
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
//
//
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
//
//
import Petition_Form from './1_Petition_Form/Trinket.svelte'
import Petition_Verification from './2_Petition_Verification/Trinket.svelte'
import Petition_Send from './3_Petition_Send/Trinket.svelte'
import Signature_Receive from './4_Signature_Receive/Trinket.svelte'
import Signature_Verification from './5_Signature_Verification/Trinket.svelte'
import Adaptation_Suggestion from './6_Adaptation_Suggestion/Trinket.svelte'
//
import {
	refresh_truck, 
	retrieve_truck, 
	monitor_truck,
	destroy_truck
} from './Truck/index.js'
//
////


let prepared = "no"
let freight = {}

onMount (() => {
	refresh_truck ()
	
	const Truck = retrieve_truck ()
	freight = Truck.freight;
	
	monitor_truck ((_freight) => {
		freight = _freight;
	})
	
	prepared = "yes"
});
onDestroy (() => {
	destroy_truck ()
});

</script>


{#if prepared === "yes" }
<div class="card p-2">
	{#if freight.leaf_name === "Petition Form" }
		<Petition_Form />
	{:else if freight.leaf_name === "Petition Verification" }
		<Petition_Verification />
	{/if}
</div>
{/if}