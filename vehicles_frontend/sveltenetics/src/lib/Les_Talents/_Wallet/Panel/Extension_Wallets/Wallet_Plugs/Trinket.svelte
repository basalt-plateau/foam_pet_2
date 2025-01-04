

<script>

//
import { onMount, onDestroy } from "svelte"
//
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"
//

import Wallet_Plug from './Wallet_Plug/Trinket.svelte'


const obtain_wallet = ({ wallet }) => {
	console.log ("obtain_wallet:", { wallet });
	window.open (wallet.url, '_blank');
}

let flourisher_freight = Extension_Winch.freight ();
let flourisher_monitor;
onMount (async () => {
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
});
onDestroy (async () => {
	flourisher_monitor.stop ()
});

</script>

<div 
	style="
		width: 100%;
		height: 400px;
		
		display: flex;
		gap: 10px;
		flex-direction: column;
	"
>
	
	<div 
		style="
			width: 100%;
			text-align: center;
		"
		class="card p-2 variant-soft-primary"
	>
		<header>Wallet Options</header>
	</div>
	
	<div 
		style="
			width: 100%;
			height: 400px;
			
			display: flex;
			flex-direction: column;
			align-items: center;
			gap: 10px;
		"
		class="card p-2 variant-filled-primary"
	>
		{#each Object.keys (flourisher_freight.stages) as stage_name }
		<Wallet_Plug 
			stage_name={ stage_name }
			stage={ flourisher_freight.stages [ stage_name ] }	
		/>		
		{/each}
	</div>	
</div>	