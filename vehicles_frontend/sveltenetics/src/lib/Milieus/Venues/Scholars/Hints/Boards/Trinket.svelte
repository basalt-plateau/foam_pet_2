
<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'


////
//
const tutorial_2 = '/pictures/tutorial_2.svg';
const machines_picture = '/pictures/machines.svg';
const pets = '/pictures/Foam_Pet_Bothies.svg';
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


	<div class="card p-4 variant-soft-surface" style="display: none">
		<!-- Supermassive Reservoir -->
		<!-- Supermassive Pupil that can send the speed of light through fonction frontiers. -->
		<!-- Gargantuan Reservoir Wallet Logistics Duo for -->
	
		<div
			style="
				margin: 0 auto;
				width: 100%;
				max-width: 700px;
				text-align: center;
				font-size: 1.2em;
				
				display: flex;
				align-items: center;
				justify-content: center;
				
				gap: 10px;
			"
		>	
			<p>Pets for </p>
			
			<div
				style="
					display: flex;
					align-items: center;
				"
			>
				<img 
					src="/_Licensed/Aptos/aptos.png" 
					style="
						display: none;
						width: 0.75cm;
						height: 0.75cm;								
					"
				/>
				<Slang text="Aptos" />
			</div>
		</div>
	</div>

</div>


