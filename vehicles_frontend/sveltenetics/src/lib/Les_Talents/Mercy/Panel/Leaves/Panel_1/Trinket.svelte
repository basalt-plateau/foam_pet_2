



<script>
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'


export let join_mercy_harvest = () => {}

</script>

<Leaf>
	<div
		style="
			box-sizing: border-box;
			height: 100%;
			width: 100%;
			
			padding: 1cm;
			
			display: flex;
			justify-content: center;
			align-items: center;
			
			flex-direction: column;
			
			gap: 0.5cm;
		"
	>
		<div class="card p-4"
			style="
				width: 100%;
				text-align: center;
			"
		>
			<header
				style="
					font-size: 3em;
				"
			>Mercy</header>
		</div>
		
		<div class="card p-4"
			style="
				width: 100%;
				text-align: center;
			"
		>
			<button type="button" class="btn variant-filled">Establish the Mercy Harvest</button>
		</div>
		
		<div
			style="
				display: flex;
				gap: 1em;
			
				width: 100%;
				text-align: center;
			"
		>
			<div class="card p-4"
				style="
					width: 100%;
					text-align: center;
				"
			>
				<button 
					type="button" 
					class="btn variant-filled"
					on:click={ join_mercy_harvest }
				>Join</button>
			</div>
			<div class="card p-4"
				style="
					width: 100%;
					text-align: center;
				"
			>
				<button type="button" class="btn variant-filled">Leave</button>
			</div>
		</div>
		
		<div class="card p-4"
			style="
				width: 100%;
				text-align: center;
			"
		>
			<button type="button" class="btn variant-filled">Buy Mercy</button>
			
			<div class="card p-4 variant-soft-primary"
				style="
					margin: 1cm 0;
					width: 100%;
					text-align: center;
				"
			>
				<h1
					style="
						margin: 1cm 0;
					"
				>Sales</h1>
			
				<ol class="list">
					<li>
						<span class="badge-icon p-4 variant-filled-primary">1.</span>
						<span class="flex-auto badge p-4 variant-filled-primary">1 Mercy for 1 APT</span>
					</li>
				</ol>
			</div>
			
			<button type="button" class="btn variant-filled">Sell Mercy</button>
			
		</div>
		
		
		<div class="card p-4"
			style="
				width: 100%;
				text-align: center;
			"
		>
			<button type="button" class="btn variant-filled">Send Mercy</button>
			<button type="button" class="btn variant-filled">Receive Mercy</button>
		</div>
	</div>
</Leaf>

