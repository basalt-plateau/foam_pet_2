


<script>

/*
	import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
	<Petition_APT_Button
		button_text="Buy 1 Membership Pass"
		APT="0"
		clicked={}
	/>
*/

export let button_text = ""
export let APT = ""
export let clicked = () => {}

</script>



<button 
	type="button" 
	on:click={ clicked }

	style="
		padding: 0.2cm 0.25cm 0.2cm 0.5cm;
	"
	class="btn variant-filled"
>
	<span
		style="
			font-size: 1.2em;
			font-weight: bold;
		"	
	>{ button_text }</span>

	<span 
		style="
			display: flex;
			
			justify-content: center;
			align-items: stretch;
		
			flex-direction: row;
		"
		class="badge variant-soft-primary"
	>
		<div
			style="
				display: flex;
				
				justify-content: center;
				align-items: center;
			
				flex-direction: row;
				gap: 0.1cm;
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
			>{ APT }</span>
		</div>
		
		<div
			class="badge variant-filled-primary"
		>
			<span
				style="
					font-size: 1.2em;		
					transform: translateY(2px);
				"
			>+ Gas Fees</span>
		</div>
	</span>
</button>