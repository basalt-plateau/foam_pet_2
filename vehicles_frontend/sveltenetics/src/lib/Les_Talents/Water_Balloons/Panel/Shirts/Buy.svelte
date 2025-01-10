
<script>

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"

const buy_5_water_balloons = () => {
	console.log ("buy_5_water_balloons");
}


</script>


<div>
	<div
		style="
			text-align: center;
		"
		class="card p-4"
	>
		<header>Buy</header>
	</div>
	
	<div class="card p-4"
		style="
			width: 100%;
			text-align: center;
			
			display: flex;
			justify-content: space-around;
		"
	>
		<Petition_APT_Button
			button_text="5 Water Balloons"
			APT="1"
			clicked={ buy_5_water_balloons }
			permitted={ "yes" }
		/>
	</div>










</div>