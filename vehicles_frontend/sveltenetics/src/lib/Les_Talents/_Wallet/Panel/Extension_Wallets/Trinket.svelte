

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
import Wallet_Plugs from "./Wallet_Plugs/Trinket.svelte"
import Connected from "./Connected/Trinket.svelte"
//


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
<div>
	<div style="height: 0.5cm;" />
	
	{#if flourisher_freight.bridge_is_connected === "yes" }
	<Connected />
	{:else}
	<Wallet_Plugs />
	{/if}
</div>
{/if}