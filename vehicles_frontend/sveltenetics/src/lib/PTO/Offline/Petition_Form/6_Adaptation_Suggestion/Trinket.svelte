
<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'


import Petition_Truck from '$lib/PTO/Offline/Petition_Form/Truck/Ride.svelte'
let PT_Freight = false


let asked = ""
let ask = () => {
	
}



</script>

<div
	style="
		display: flex;
		gap: 0.1cm;
		
		flex-direction: column;
		
		padding: 0.25cm;
	"
>
	<Petition_Truck on_change={ ({ pro_freight }) => { PT_Freight = pro_freight; } } />
	{#if typeof PT_Freight === "object"}

	<div
		style="
			text-align: center;
		"
	>
		<header
			style="
				text-align: center;
				font-size: 2em;
				padding: .2cm 0;
			"
		><Slang text="Transaction" /> Suggestion</header>
		
		<div style="height: 0.5cm"></div>
	</div>	


	<div
		class="card p-4"
		style="
			text-align: center;
		"
	>
		<p
			style="
				font-size: 1.1em;
			"
		><Slang text="Petition" /> + <Slang text="Signature" /> + <Slang text="Consensus" /> approval = <Slang text="Blockchain" /> <Slang text="Transaction" /> </p>
	</div>

	<div style="height: 0.5cm"></div>

	<div
		class="card p-4"
		style="
			text-align: center;
		"
	>
		<div style="height: 1cm"></div>
	
		<p>
			<span style="display: block;">To Suggest the <Slang text="Petition" /> with <Slang text="Signature" /> to the <Slang text="Consensus" />,
			<span style="display: block;">press this button:</span>
		</p>
	
		<div style="height: 1cm"></div>
	
		<button 
			monitor="suggestion pad"
			
			disabled={ asked === "yes" }
		
			on:click={ ask }
			type="button" 
			class="btn variant-filled-primary"
			style="
				white-space: preserve;
				word-wrap: break-word;
				
				width: 200px;
				height: 200px;
				
				border: 0.25cm solid rgb(var(--color-tertiary-500));
				
				font-size: 2em;
			"
			
		></button>
		
		<div style="height: 1cm"></div>		
	</div>
	
	<div style="height: 5cm"></div>		

	{/if}
</div>