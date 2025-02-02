


<script>


import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
	

let petition_APT_button = "";

const clicked = () => {
	console.info ("clicked");
	
	petition_APT_button.mode ("progress");

	setTimeout (() => {
		petition_APT_button.mode ("success", {
			note: "was successful"
		});
	}, 2000);
	
	setTimeout (() => {
		petition_APT_button.mode ("imperfection", {
			note: "imperfection"
		});
	}, 4000);
}


</script>

<Leaf>
	<div class="card p-4">
		<Petition_APT_Button
			bind:this={ petition_APT_button }
		
			button_text="Buy 1 Membership Pass"
			
			APT="0"
			clicked={ clicked }
		/>
	</div>
</Leaf>