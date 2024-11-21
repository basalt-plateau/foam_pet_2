
<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'

////
//
const pet = '/pictures/Foam_Pet_0001.svg';
const pet_2 = '/pictures/Foam_Pet_0002.svg';
//
////

</script>

<div class="card p-4">
	<div class="card p-4 variant-soft-primary">
		<div style="height: 1cm"></div>
		
		<header 
			style="
				display: flex;
				justify-content: center;
				align-items: center;
				gap: 5%;
				
				margin: 0 auto;
				
				width: 100%;
				max-width: 700px;
				
				
				text-align: center;
				font-family: sans-serif !important;
			"
		>
			<img 
				style="
					height: 1.4cm;
				"
				src={ pet } 
				alt="pet" 
			/>
			
			<div>
				<header 
					style="
						font-weight: bold;
						font-family: sans-serif;
						font-size: 4em; 
					"
					class="gradient-heading"
				>Foam Pets</header>
			</div>
			
			<img 
				style="
					height: 1.4cm;
				"
				src={ pet_2 } 
				alt="pet 2" 
			/>
		</header>
				
		<div style="height: 1cm"></div>
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

	<!-- 
	<Taxonomy /> 
	<div style="height: 1cm"></div>
	-->
</div>