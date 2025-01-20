

<script>

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"

const join = () => {
	
}

// quit, exit, leave
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
			display: flex;
			flex-direction: column;
			gap: 0.25cm;
		"
		class="card p-4"
	>
		<div
			style="
				text-align: center;
				font-size: 1.5em;
			"
		>
			<header>Team</header>
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
				button_text="Join"
				APT="1"
				clicked={ join }
				
				permitted={ "yes" }
			/>
			
			<Petition_APT_Button
				button_text="Exit"
				APT="0"
				clicked={ exit }
				
				permitted={ "yes" }
			/>
		</div>
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