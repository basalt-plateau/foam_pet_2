

<script>

////
//
import { onMount, onDestroy } from "svelte"
import { Autocomplete } from '@skeletonlabs/skeleton';
import { popup } from '@skeletonlabs/skeleton';
import _merge from 'lodash/merge'
//
//
import { has_field } from 'procedures/object/has_field'
//
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"
//
//
import Wallet_Plugs from "./Wallet_Plugs/Tome.svelte"
import Connected from "./Connected/Tome.svelte"
//
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
let Extension_Winch_Freight = false

	

let mounted = "no"
let flourisher_monitor = ""
let flourisher_freight = ""
onMount (async () => {
	flourisher_freight = Extension_Winch.freight ();
	flourisher_monitor = Extension_Winch.monitor (async ({
		original_freight,
		pro_freight, 
		//
		target,
		//
		property, 
		value
	}) => {
		flourisher_freight = pro_freight;
	});
	
	mounted = "yup"
});
onDestroy (() => {
	flourisher_monitor.stop ()
});

</script>



{#if mounted === "yup" }
<div
	style="
		width: 100%;
		
	"
>
	<div style="height: 0.5cm;" />
	<Extension_Winch_Ride on_change={ ({ pro_freight }) => { Extension_Winch_Freight = pro_freight; } } />
	{#if typeof Extension_Winch_Freight === "object"}
	{#if Extension_Winch_Freight.stage_name_connected.length >= 1 }
	<Connected />
	{:else}
	<Wallet_Plugs />
	{/if}
	{/if}
</div>
{/if}