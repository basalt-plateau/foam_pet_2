
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

import Address_Qualities_Trinket from '$lib/trinkets/Address_Qualities/Trinket.svelte'

let origin_address = {
	effective: "no",
	address_hexadecimal_string: "",
	exception: ""
}

let previous_address_hexadecimal_string = ""
const on_change = ({
	effective,
	address_hexadecimal_string,
	exception
}) => {
	// origin_address.effective = effective;
	// origin_address.address_hexadecimal_string = address_hexadecimal_string;
	// origin_address.exception = exception;
	
	
	if (previous_address_hexadecimal_string === address_hexadecimal_string) {
		return;
	}
	
	previous_address_hexadecimal_string = address_hexadecimal_string;
	
	console.log ("on_change:", { effective, address_hexadecimal_string, exception });
	
	address_of_flourisher_chosen ({ 
		address_of_flourisher: address_hexadecimal_string
	})
}

let address_trinket = ""
const on_prepare = () => {
	address_trinket.change_address_hexadecimal_string ("")
}


export let address_of_flourisher_chosen = () => {}
export let header_size = ""



				

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
	
	<Address_Qualities_Trinket 
		name=""
	
		bind:this={ address_trinket }
		
		on_change={ on_change }
		on_prepare={ on_prepare }
	/>
</div>


