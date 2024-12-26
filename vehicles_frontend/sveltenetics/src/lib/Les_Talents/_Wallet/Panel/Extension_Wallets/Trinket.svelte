

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
import * as Flourisher from "$lib/Singles/Flourisher.js"
//

import Wallet_Plugs from "./Wallet_Plugs/Trinket.svelte"

let mounted = "no"
let flourisher_monitor = ""
let flourisher_freight = ""
onMount (async () => {
	flourisher_freight = Flourisher.freight ();
	flourisher_monitor = ask_for_flourisher_monitor (async ({
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
	<div class="card p-2">
		<header
			style="
				font-size: 2em;
				text-align: center;
			"
		>Extension Wallets</header>
		
		<span class="badge variant-filled">
			<span class="badge variant-filled">Connected:</span>
			<span class="badge variant-filled-primary">{ flourisher_freight.wallet_is_connected }</span>
		</span>
	</div>
	
	<div 
		style="
			height: 0.5cm;
		" 
	/>
	
	<Wallet_Plugs />
</div>
{/if}