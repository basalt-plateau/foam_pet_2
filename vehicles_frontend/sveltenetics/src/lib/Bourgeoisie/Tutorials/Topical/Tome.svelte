
<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'


</script>

<div 
	style="
		display: flex;
		flex: 0.6;
		justify-content: center;
		flex-direction: column;
		min-height: 100%;
	"
>
	<div
		class="card p-4"
		style="
			padding: 0.5cm;
			width: 100%;
		"
	>
		<p
			style="
				text-align: center;
				font-size: 1em;
			"
		>This is the <Slang text="Label" /> Bourgeoisie Wallet prototype.</p>
	</div>

	<div style="height: 0.5cm"></div>
	
	
	
	<div
		class="card p-4"
		style="
			padding: 1cm;
			width: 100%;
		"
	>
		<p
			style="
				text-align: center;
				font-size: 1.2em;
			"
		>These activities should happen offline.</p>
		
		<div style="height: 0.25cm"></div>
		
		<p style="text-align: center">
			The QR code interface should be used.
		</p>
		
		
		<div style="height: 0.25cm"></div>
		
		<div
			class="card variant-soft-surface p-4"
			style="
				max-width: 15cm;
				margin: 0 auto;
			"
		>
			<ol class="list">
				<li class="card p-4">
					<span class="badge-icon p-4 variant-soft-primary">1</span>
					<span class="flex-auto">The Wallet can be downloaded from "Franchise".
					</span>
				</li>
				<li class="card p-4">
					<span class="badge-icon p-4 variant-soft-primary">2</span>
					<span class="flex-auto">
						<Slang text="Accounts"/> is for choosing <Slang text="Account"/>
					</span>
				</li>
				<li
					class="card p-4"
					style="
						line-height: 2em;
					"
				>
					<span class="badge-icon p-4 variant-soft-primary">3</span>
					
					<span class="flex-auto">"Consent" is where suggestions can be signed.</span>
				</li>
			</ol>
		</div>
	</div>
</div>

