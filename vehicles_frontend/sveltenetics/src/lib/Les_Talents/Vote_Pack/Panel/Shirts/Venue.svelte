

<script>

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"

const build = () => {
	
}

const demolish = () => {
	
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
			button_text="Build"
			APT="0"
			clicked={ build }
			
			permitted={ "yes" }
		/>
		
		<Petition_APT_Button
			button_text="Demolish"
			APT="0"
			clicked={ demolish }
			
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

