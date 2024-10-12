


<script>

/*	

*/

import { onMount } from 'svelte'

import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Field from '$lib/trinkets/Field/Trinket.svelte'

import { assert_is_natural_numeral_string } from '$lib/taverns/numerals/natural/is_string'

let field = ""

const packet_type = "number"

const field_on_change = ({ packet }) => {
	const actual_packet_type = typeof packet;
	
	try {
		assert_is_natural_numeral_string (packet)
	}
	catch (exception) {
		return {
			"problem": exception.message
		}
	}
	
	return {}
}


onMount (() => {
	field.modify_packet ("600")
})


</script>

<Leaf>
	<div class="card p-4">
		<Field 
			logo="Max Gas Amount, in Octas"
	
			bind:this={ field }
			on_change={ field_on_change }
			
			packet_type={ packet_type }
		/>
	</div>
</Leaf>