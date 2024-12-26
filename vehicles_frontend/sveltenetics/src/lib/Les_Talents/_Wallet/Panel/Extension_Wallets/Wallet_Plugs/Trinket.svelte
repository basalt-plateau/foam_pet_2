

<script>
import { onMount, onDestroy } from "svelte"
import * as Flourisher from "$lib/Singles/Flourisher.js"

let flourisher_freight = Flourisher.freight ();
let flourisher_monitor;
onMount (async () => {
	let flourisher_monitor = Flourisher.monitor (async ({
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
	class="card p-2"
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
		class="card p-2"
	>
		{#each flourisher.wallets_list as wallet}
		<div
			style="
				display: flex;
				flex-direction: row;
				align-items: center;
				justify-content: space-between;
				gap: 10px;
				
				width: 100%;
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
				<p>{ wallet.name }</p>
			</div>
			
			{#if true }
			<span class="badge variant-soft-primary">{ wallet.readyState }</span>
			{/if}
			
			{#if false && wallet.isSignTransactionV1_1 }
			<span class="badge variant-soft-primary">Is Sign TransactionV1_1</span>
			{/if}
			
			{#if wallet.isAIP62Standard }
			<span class="badge variant-soft-primary">AIP 62 Standard</span>
			{/if}


			<button 
				type="button" 
				class="btn btn-sm variant-filled"
				on:click={() => {
					flourisher.connect ({ wallet });
					
				}}
			>Connect</button>	

			<div>
				{#if wallet.readyState === "Installed" }
				<button 
					type="button" 
					class="btn btn-sm variant-filled"
					on:click={() => {
						flourisher.connect ({ wallet });
					}}
				>Connect</button>						
				
				{:else if wallet.readyState === "NotDetected" }
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