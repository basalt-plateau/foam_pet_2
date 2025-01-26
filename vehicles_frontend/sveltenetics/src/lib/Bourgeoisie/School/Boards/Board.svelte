


<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'


////
//
const tutorial_2 = '/pictures/tutorial_2.svg';
const machines_picture = '/pictures/machines.svg';
const pets = '/pictures/Foam_pet.svg';
const pet = '/pictures/Foam_Pet_0001.svg';
const pet_2 = '/pictures/Foam_Pet_0002.svg';
//
////

</script>

<div
	class="card p-4"
	style="
		width: 100%;
	"
>	
	<div
		style="
			display: flex;
			border-radius: 4px;
			justify-content: center;
		"
		class="card p-4 variant-soft-surface"
	>
		<img 
			src={ pets } 
			alt="pets"
			
			style="
				border-radius: 14px;
				border: 4px solid rgba(var(--color-primary-500));
			"
		/>
	</div>

	<div style="height: 0.25cm" />

	<div 
		style="
			display: flex;
			justify-content: center;
			flex-direction: column;
		"
		class="card p-4 variant-soft-surface"
	>
		<div 
			style="width: 100%"
			class="card p-4 variant-soft-surface"
		>
			<header
				style="
					text-align: center;
					font-size: 1.5em;
					font-weight: bold;
				"
			>Lobbying</header>
		</div>
		
		<div style="height: 0.25cm"></div>
		
		<div
			style="
				display: flex;
				justify-content: center;
				flex-direction: row;
			"
		>
			<div 
				style="width: 50%"
				class="card p-4 variant-soft-surface"
			>
				<p
					style="text-align: center; font-size: 1.5em; font-weight: bold;"
				>
					<Slang text="Wallet" />
				</p>
				
				<div style="height: 0.25cm" />
				<hr class="!border-t-2" />
				<div style="height: 0.25cm" />
				
				<p
					style="
						text-align: center;
						line-height: 200%;
					"
				>
					Each <Slang text="transaction_petition" /> requires a unique form of <Slang text="signature" /> from the <Slang text="Wallet" />.
				</p>
			</div>
			
			<div 
				style="width: 1%"
			></div>
			
			<div 
				style="width: 50%"
				class="card p-4 variant-soft-surface"
			>
				<p
					style="text-align: center; font-size: 1.5em; font-weight: bold;"
				>
					<Slang text="Sender" />
				</p>
				
				<div style="height: 0.25cm" />
				<hr class="!border-t-2" />
				<div style="height: 0.25cm" />
				
				<p
					style="
						text-align: center;
						line-height: 200%;
					"
				>
					Once <Slang text="signature" /> is received from the <Slang text="Signatory" />, <Slang text="a_sender" /> can suggest the <Slang text="transaction_petition" /> + <Slang text="signature" /> to the <Slang text="Consensus" />.
				</p>
			</div>
		</div>
	</div>

	<div style="height: 0.25cm" />


	{#if true }
	<div 
		style="
			display: flex;
			justify-content: center;
			flex-direction: row;
		"
	>
		<div 
			style="width: 50%"
			class="card p-4 variant-soft-surface"
		>
			<p
				style="text-align: center; font-size: 1.5em;"
			><Slang text="Offline Machine" /></p>
			<p style="font-size: 1em; text-align: center; line-height: 2em">
				<span class="badge variant-soft-primary">Offline Machine</span>
				<span class="badge variant-soft-primary">Offline Signing</span>
				<span class="badge variant-soft-primary">Beacon with Limited Connectivity</span>
				<span class="badge variant-soft-primary">Keys Ring</span>
				<span class="badge variant-soft-primary">Loyal Pet</span>	
			</p>
		</div>
		
		<div 
			style="width: 1%"
		></div>
		
		<div 
			style="width: 50%"
			class="card p-4 variant-soft-surface"
		>
			<p
				style="text-align: center; font-size: 1.5em;"
			><Slang text="Online Machine" /></p>
			<p style="font-size: 1em; text-align: center; line-height: 2em">
				<span class="badge variant-soft-primary">Emergency Dispatch Buttons</span>
				<span class="badge variant-soft-primary">SOS Beacon</span>
				<span class="badge variant-soft-primary">Emergency Kiosk</span>
				<span class="badge variant-soft-primary">Howl Amp</span>
				<span class="badge variant-soft-primary">Internet Connected Beacon</span>
				<span class="badge variant-soft-primary">Friendly Pet</span>
				<span class="badge variant-soft-primary">Online Machine</span>
				<span class="badge variant-soft-primary">Checkout</span>
			</p>
		</div>
	</div>
	{/if}
</div>


