


<script>

//\\
//
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
//
//
import { parse_styles } from '$lib/trinkets/styles/parse.js';
//
////


</script>





<Leaf>
	<div
		class="card p-4"
		style="
			width: 100%;
		"
	>
		<div style="height: 0.5cm"></div>
	
		<header
			style="
				font-size: 3em;
				text-align: center;
				font-size: bold;
			"
		>
			<span
				style="
					display: inline-block;
				"
			>
				Hints
			</span>
		</header>
		
		<div style="height: 0.5cm"></div>
	</div>

	<div style="height: 0.2cm"></div>

	

	<div 
		style="
			display: flex;
			flex: 0.6;
			justify-content: center;
			flex-direction: column;
			min-height: 100%;
		"
	>
		<div style="height: 0.2cm"></div>

		<div
			class="card p-4"
			style="
				padding: 1cm;
				width: 100%;
			"
		>
			<header
				style="
					font-size: 2.5em;
					text-align: center;
				"
			>Offline Wallet</header>
					
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
						<span class="badge-icon p-4 variant-soft-primary">2</span>
						
						<span class="flex-auto">
							To ask the <Slang text="Consensus"/> to add a <Slang text="Transaction"/> to the <Slang text="Blockchain"/>,
							a <Slang text="Petition"/> with <Slang text="a_signature"/> is necessary.
						</span>
					</li>
				</ol>
			</div>
		</div>

		<div style="height: 1cm"></div>

	</div>
</Leaf>