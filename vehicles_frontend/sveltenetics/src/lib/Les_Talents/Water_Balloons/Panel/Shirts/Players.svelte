

<script>

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"

const join = () => {
	
}

const leave = () => {

}


</script>


<div>
	<div
		style="
			text-align: center;
		"
		class="card p-4"
	>
		<header>Players</header>
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
			APT="0"
			clicked={ join }
			
			permitted={ "yes" }
		/>
		
		<Petition_APT_Button
			button_text="Leave"
			APT="0"
			clicked={ leave }
			
			permitted={ "yes" }
		/>
	</div>










</div>