

<script>

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"

const enter = () => {
	
}

const exit = () => {

}


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
		<header>Mascots</header>
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
			button_text="Buy a Pass"
			APT="1"
			clicked={ enter }
			
			permitted={ "yes" }
		/>
		
		<Petition_APT_Button
			button_text="Exit"
			APT="0"
			clicked={ exit }
			
			permitted={ "yes" }
		/>
	</div>

	<div class="card p-4"
		style="
			width: 100%;
			text-align: center;
			
			display: flex;
			justify-content: space-around;
		"
	>
		<header>Roster</header>
	
	</div>








</div>