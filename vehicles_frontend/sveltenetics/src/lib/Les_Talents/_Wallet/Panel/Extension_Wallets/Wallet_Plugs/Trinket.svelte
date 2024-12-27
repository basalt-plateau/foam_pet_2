

<script>

//
import { onMount, onDestroy } from "svelte"
//
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"
//

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
		{#each flourisher_freight.wallets_list as wallet}
		<div
			style="
				display: flex;
				flex-direction: row;
				align-items: center;
				justify-content: space-between;
				gap: 10px;
				
				width: 100%;
				min-width: 200px;
			"
			class="card p-2"
		>
			<div
				style="
					display: flex;
					flex-direction: row;
					align-items: center;
					justify-content: left;
					gap: 10px;
					
					width: 100%;
				"
			>
				{#if wallet.icon.length >= 1}
				<img 
					src={ wallet.icon } 
					style="
						height: 0.75cm;
						width: 0.75cm;
						
						display: flex;
						flex-direction: row;
						align-items: center;
						justify-content: space-between;
						gap: 10px;
					"
				/>
				{/if}
				<p>{ wallet.name }</p>
			</div>


			<div>
				{#if wallet.installed === "yes" }
				<button 
					type="button" 
					class="btn btn-sm variant-filled"
					on:click={() => {
						flourisher_freight.connect ({ wallet });
					}}
				>Connect</button>						
				
				{:else if wallet.installed === "no" }
				<button 
					type="button" 
					class="btn btn-sm variant-filled"
					on:click={() => {
						obtain_wallet ({ wallet });
					}}
				>Obtain</button>
				{/if}
			</div>
		</div>
		{/each}
	</div>	
</div>	