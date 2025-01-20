

<script>

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"

const begin = () => {
	
}

const end = () => {
	
}

</script>


<div
	style="
		display: flex;
		gap: 0.1cm;
		flex-direction: column;
	"
>
	<div class="card p-4"
		style="
			width: 100%;
			text-align: center;
			
			display: flex;
			justify-content: space-around;
		"
	>
		<Petition_APT_Button
			button_text="Begin"
			APT="0"
			clicked={ begin }
			
			permitted={ "yes" }
		/>
		
		<Petition_APT_Button
			button_text="End"
			APT="0"
			clicked={ end }
			
			permitted={ "yes" }
		/>
	</div>
	
	<div class="card p-4"
		style="
			width: 100%;
			text-align: center;
		"
	>

	</div>
</div>

