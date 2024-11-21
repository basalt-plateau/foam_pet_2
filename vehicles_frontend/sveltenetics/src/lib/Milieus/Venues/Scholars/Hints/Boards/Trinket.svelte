
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
	>
		<img src={ pets } alt="Machines" />
	</div>
	
	<div class="card p-1 variant-filled-surface">
		<p
			style="
				width: 100%;
				text-align: center;
			"
		>	
			Event Horizon Wallet Logistics Duo for <Slang text="Aptos" />
		</p>
	</div>

	<div style="height: 0.25cm" />

	<div 
		style="
			display: flex;
			justify-content: center;
			flex-direction: row;
		"
	>
		<div 
			style="width: 50%"
			class="card p-4"
		>
			<p
				style="text-align: center; font-size: 1em;"
			>Signatory</p>
		</div>
		
		<div 
			style="width: 1%"
		></div>
		
		<div 
			style="width: 50%"
			class="card p-4"
		>
			<p
				style="text-align: center;"
			>Publicist</p>
		</div>
	</div>

	<div style="height: 0.25cm" />


	<div 
		style="
			display: flex;
			justify-content: center;
			flex-direction: row;
		"
	>
		<div 
			style="width: 50%"
			class="card p-4"
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
			class="card p-4"
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
</div>


