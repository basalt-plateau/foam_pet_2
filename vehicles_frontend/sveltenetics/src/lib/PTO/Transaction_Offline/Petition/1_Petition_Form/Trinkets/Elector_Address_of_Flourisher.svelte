
<script>


/*
	<Obtainer_Address_of_Flourisher 
		address_of_flourisher_chosen={ address_of_flourisher_chosen }
	/>
*/

/*
	.provider
*/

import Slang from '$lib/trinkets/Slang/Trinket.svelte'




export let address_of_flourisher_chosen = () => {}
export let header_size = ""


function on_choose (event) {
	console.log ("on_choose:", event);
	address_of_flourisher_chosen ({ 
		address_of_flourisher: event.target.value
	})
}


				

</script>

<div class="card p-4">
	<div
		style={ `
			text-align: center;
			font-size: ${ header_size };
			padding: 0.25cm 0;
		` }
	>
		<Slang text="Signer" /> Hexadecimal Address
	</div>
	
	<textarea 
		style="
			padding: 0.25cm;
		"
		class="textarea"  
		
		on:keyup={ on_choose }
	/>
</div>


