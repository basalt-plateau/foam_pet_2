



<script>

import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'

export let join_mercy_harvest__petition = () => {}
export let join_mercy_harvest__sign = () => {}


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
				<header
					style="
						font-size: 2em;
					"
				>Join</header>
			
				<button 
					type="button" 
					class="btn variant-filled"
					on:click={ join_mercy_harvest__petition }
				>Petition</button>
				
				<button 
					type="button" 
					class="btn variant-filled"
					on:click={ join_mercy_harvest__sign }
				>Sign</button>
			</div>
			<div class="card p-4"
				style="
					width: 100%;
					text-align: center;
				"
			>
				<header
					style="
						font-size: 2em;
					"
				>Leave</header>
			
				<button 
					type="button" 
					class="btn variant-filled"
				>Petition</button>
				
				<button 
					type="button" 
					class="btn variant-filled"
				>Sign</button>
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
				<header
					style="
						font-size: 2em;
					"
				>Send</header>
			
				<button 
					type="button" 
					class="btn variant-filled"
				>Petition</button>
				
				<button 
					type="button" 
					class="btn variant-filled"
				>Sign</button>
			</div>
			<div class="card p-4"
				style="
					width: 100%;
					text-align: center;
				"
			>
				<header
					style="
						font-size: 2em;
					"
				>Receive</header>
			
				<button 
					type="button" 
					class="btn variant-filled"
				>Petition</button>
				
				<button 
					type="button" 
					class="btn variant-filled"
				>Sign</button>
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

