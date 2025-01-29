

<script>

//
import { onMount, onDestroy } from "svelte"
//
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"
//

import Wallet_Plug from './Wallet_Plug/Tome.svelte'


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
		max-width: 20cm;
		margin: 0 auto;
		
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
		class="card p-2"
	>
		<header
			style="
				display: flex;
				align-items: center;
				gap: 0.25cm;
				justify-content: center;
			"
		>
			<span>Aptos</span>
			<img src="/_Licensed/Aptos/aptos.png" style="width: 0.5cm; height: 0.5cm;">
			<span>Wallet Options</span>
		</header>
		<a 
			target="_blank"
			href="https://aptosfoundation.org"
		>https://aptosfoundation.org</a>
	</div>
	
	<div 
		style="
			width: 100%;
			text-align: center;
			
			display: grid;
			gap: 0.25cm;
		"
		class="card p-2"
	>
		<header
			style="
				display: flex;
				align-items: center;
				gap: 0.25cm;
				justify-content: center;
			"
		>
			<span><b>Keystone 3 Pro</b> with the <b>Petra Extension</b> is recommended.</span>
		</header>
		<div class="card p-2">
			<a 
				target="_blank"
				href="https://keyst.one"
			>https://keyst.one</a>
		</div>
		<div class="card p-2">
			<a 
				target="_blank"
				href="https://petra.app"
			>https://petra.app</a>
		</div>
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
		class="card p-2"
	>
		{#each Object.keys (flourisher_freight.stages) as stage_name }
		<Wallet_Plug 
			stage_name={ stage_name }
			stage={ flourisher_freight.stages [ stage_name ] }	
		/>		
		{/each}
	</div>	
</div>	