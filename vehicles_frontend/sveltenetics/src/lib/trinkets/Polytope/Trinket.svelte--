


<script>

/*
import Polytope from '$lib/trinkets/Polytope/Trinket.svelte'

<Polytope 
	prepare={ prepare }
	enhance={ enhance }
>
	<div slot="leaves">
		<Transaction_Fields_Trinket 
			leaf="1" 
		/>
		<Unsigned_Transaction_Trinket 
			leaf="2" 
		/>
		<Transaction_Signature_Fields_Trinket 
			leaf="3" 
		/>
		<Transaction_Signature_Trinket 
			leaf="4"
		/>
		<Ask_Consensus 
			leaf="5"
		/>
	</div>
</Polytope>

const prepare = () => {
	return {
		name: "Transfer",
		next: "yes",
		back: "yes"
	}
}
*/

import Polytope from './Fabric.svelte'

import { onMount } from 'svelte'
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
const modal_store = getModalStore ();


let prepared = "no"

export const enhance = () => {
	
}

export const open_the_position = ({
	name = ""
}) => {
	return;
	
	modal_store.trigger ({
		type: 'component',
		
		backdropClasses: '!bg-green-500',
		modalClasses: '!bg-red-500',
		
		component: {
			ref: Polytope,
			props: { 
				modal_store,
				name
			}
		}
	});
}

onMount (() => {
	prepared = "yes"
	
	// prepare_the_modal ()
})


</script>

<div>
	The Polytope Trinket

	{ prepared }
	
</div>