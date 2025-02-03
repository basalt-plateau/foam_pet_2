

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
import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
//
//
import Wallet_Plugs from "./Wallet_Plugs/Tome.svelte"
import Connected from "./Connected/Tome.svelte"
//
////

let Extension_Winch_Freight = false

	

let mounted = "no"
onMount (async () => {
	mounted = "yup"
});
onDestroy (() => {});

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