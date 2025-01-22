
<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import Team_Details from "$lib/Les_Talents/Sport_Pack/Boards/Team_Details/Board.svelte"

const buy_5_water_balloons = () => {
	console.log ("buy_5_water_balloons");
}

let price_of_play = 1;
let APT_Price = 1
let amount = 1;
$: {
	APT_Price = amount * price_of_play;
}

let leaf = "Buy"

</script>


<div
	style="
		display: flex;
		gap: 0.1cm;
		flex-direction: column;
	"
>
	<div
		style="
			text-align: center;
		"
		class="card p-4"
	>
		<RadioGroup>
			<RadioItem bind:group={ leaf } name="justify" value={ "Buy" }>Buy</RadioItem>		
			<RadioItem bind:group={ leaf } name="justify" value={ "Send" }>Send</RadioItem>
		</RadioGroup>
	</div>
	
	<div style="height: 0.25cm" />
	
	<div
		style="
			text-align: center;
		"
	>
		{#if leaf === "Buy" }
		<div
			style="
				text-align: center;
			"
			class="card p-4"
		>
			<header>Buy Passes</header>
		</div>
		
		<div class="card p-4"
			style="
				width: 100%;
				text-align: center;
				
				display: flex;
				justify-content: center;
				
				gap: 0.25cm;
			"
		>
			<input 
				bind:value={ amount }
			
				style="
					max-width: 10cm;
					text-indent: 0.25cm;
					padding: 0.1cm;
				"
				
				class="input" 
				type="number" 
				placeholder="Amount" 
			/>
		
			<Petition_APT_Button
				button_text="Buy"
				APT={ APT_Price }
				clicked={ buy_5_water_balloons }
				permitted={ "yes" }
			/>
		</div>
		{:else if leaf === "Send" }
		<div
			style="
				text-align: center;
			"
			class="card p-4"
		>
			<header>Send Passes</header>
			
			<Team_Details 
				name="To Address"
			/>
		</div>
		{/if}
	</div>
	
	










</div>