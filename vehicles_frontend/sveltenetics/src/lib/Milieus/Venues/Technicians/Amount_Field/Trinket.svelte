


<script>

/*	
	import Amount_Field from '$lib/trinkets/Amount_Field/Trinket.svelte'
	
	const on_amount_change = () => {}
	
	<Amount_Field 
		on_change={ on_amount_change }
		on_prepare={ on_amount_prepare }
	/>
*/

import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'


import Amount_Field from '$lib/trinkets/Amount_Field/Trinket.svelte'


let amount_field = ""
const on_amount_change = ({ 
	effects,
	actual_amount_of_Octas
}) => {
	if (effects.problems === "") {
		
	}
}

const on_amount_prepare = () => {
	amount_field.modify ({ Octas: "10" });
}

</script>

<Leaf>
	<div class="card p-4">
		<Amount_Field 
			bind:this={ amount_field }
			
			on_change={ on_amount_change }
			on_prepare={ on_amount_prepare }
		/>
	</div>
</Leaf>