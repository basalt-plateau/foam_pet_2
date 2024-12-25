



<script>

import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'

export let join_mercy_harvest__sign = () => {}


let join_mercy_harvest__petition = () => {
	console.info ("join_mercy_harvest__petition");

	// sign and submit petition 
	// with wallet tunnel
}


</script>

<div
	style="
		height: 100%;
		overflow: auto;
		width: 100%;
		max-width: 28cm;
	"
>
	<div
		style="
			box-sizing: border-box;
			width: 100%;
			
			padding: 1cm;
			
			display: flex;
			gap: 0.2cm;
			
			flex-direction: column;
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
			<button type="button" class="btn variant-filled">Establish</button>
		</div>
		
		<div
			style="
				display: flex;
				gap: 1em;
			
				width: 100%;
				text-align: center;
			"
		>
			<div 
				style="
					width: 100%;
					text-align: center;
				"
				class="card p-4"
			>			
				<button 
					type="button" 
					on:click={ join_mercy_harvest__petition }

					style="
						padding: 0.2cm 0.25cm 0.2cm 0.5cm;
					"
					class="btn variant-filled"
				>
					<span>Buy 1 Membership Pass</span>

					<span 
						style="
							display: flex;
							justify-content: center;
							align-items: center;
						"
						class="badge variant-filled-primary"
					>
						<img 
							src="/_Licensed/Aptos/aptos.png" 
							style="
								width: 0.75cm;
								height: 0.75cm;								
							"
						/>
						<span
							style="
								font-size: 2em;		
								transform: translateY(2px);
							"
						>1</span>
					</span>
					
					
				</button>

				<button 
					type="button" 
					class="btn variant-filled"
				>Leave</button>
			</div>
		</div>
		
		<div
			style="
				display: flex;
				gap: 1em;
			
				width: 100%;
				text-align: center;
			
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
				>Send</button>
				
				<button 
					type="button" 
					class="btn variant-filled"
				>Receive</button>
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
		
		
		
	</div>
</div>

