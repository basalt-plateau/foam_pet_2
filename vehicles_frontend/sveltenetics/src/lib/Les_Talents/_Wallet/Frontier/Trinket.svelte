

<script>


/*
	import Wallet_Frontier from "$lib/Les_Talents/_Wallet/Frontier/Trinket.svelte"
	<Wallet_Frontier />
*/

//
//
import { onMount, onDestroy } from 'svelte'
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
//
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
import Loyals from "$lib/Les_Talents/_Wallet/Frontier/Letters/Loyals.svelte"
//
//
	


const modal_store = getModalStore ();

let open = async () => {
	modal_store.trigger ({
		type: 'component',
		backdropClasses: '!p-0',
		component: {
			ref: (await import ('./../Panel/Trinket.svelte')).default,
			props: { 
				modal_store
			}
		}
	});
}

let mounted = "no"
let flourisher_freight = ""
let flourisher_monitor = ""
onMount (() => {
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
	mounted = "yes"
});
onDestroy (() => {
	flourisher_monitor.stop ()
});


const wallet_address = () => {
	try {
		let address = flourisher_freight.bridge.account.address;
		if (address.substring (0,2) === "0x") {
			address = address.substring (2);
			address = address.toUpperCase ();
			return address.substring (0,3) + ".." + address.substring (address.length - 3);
		}
	}
	catch (imperfection) {}

	return "";
}

</script>


{#if mounted === "yes" }
<button 
	monitor="glyph for adaptation"
	
	on:click={ open }
	type="button" 
	class="btn bg-gradient-to-br variant-gradient-primary-secondary"
	style="
		font-size: 1em;
		padding: 6px 34px;
		
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		
		// box-shadow: 0 0 0px 2px rgb(var(--color-surface-500));
	"
>
	{#if flourisher_freight.bridge_is_connected === "yes" }
	{ wallet_address () }
	{:else}
	<Loyals 
		style={{
			width: "50px",
			height: "28px"
		}}
	/>
	{/if}
</button>
{/if}