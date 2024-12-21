

<script>


/*
	import Wallet_Portico from "$lib/Les_Talents/_Wallet/Portico/Trinket.svelte"
	<Wallet_Portico />
*/
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
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




</script>


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
	<p>Connect Wallet</p>
</button>
