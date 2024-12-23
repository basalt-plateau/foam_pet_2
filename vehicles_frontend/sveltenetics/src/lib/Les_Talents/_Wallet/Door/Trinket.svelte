

<script>


/*
	import Wallet_Portico from "$lib/Les_Talents/_Wallet/Portico/Trinket.svelte"
	<Wallet_Portico />
*/

//
//
import { onMount, onDestroy } from 'svelte'
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
//
//
import { ask_for_flourisher_freight, ask_for_flourisher_monitor } from "$lib/Singles/Flourisher"
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
let flourisher = ""
let flourisher_monitor = ""
onMount (() => {
	flourisher = ask_for_flourisher_freight ();
	flourisher_monitor = ask_for_flourisher_monitor (async ({
		original_freight,
		pro_freight, 
		//
		target,
		//
		property, 
		value
	}) => {
		flourisher = pro_freight;
	});
	mounted = "yes"
});
onDestroy (() => {
	flourisher_monitor.stop ()
});



</script>


{#if mounted === "yes" }
<button 
	monitor="glyph for adaptation"
	
	on:click={ open }
	type="button" 
	class="btn bg-gradient-to-br variant-gradient-primary-secondary"
	style="
		font-size: 1em;
		padding: 5px 12px;
		
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		
		box-shadow: 0 0 0px 2px rgb(var(--color-surface-500));
	"
>
	{#if flourisher.wallet_is_connected === "yes" }
	<p>Account</p>
	{:else}
	<p>Connect Wallet</p>
	{/if}
</button>
{/if}