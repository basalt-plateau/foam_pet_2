
<script>


//
import Polytope_1 from './Polytope_1.svelte'
import Polytope_1_Leaf from './Polytope_1_Leaf.svelte'
//
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
const modal_store = getModalStore ();
//


const enhance = () => {
	return {}
}


export const open_the_polytope = ({
	name = ""
}) => {
	modal_store.trigger ({
		type: 'component',
		
		backdropClasses: '!p-0',
		
		component: {
			ref: Polytope_1,
			props: { 
				modal_store,
				name
			}
		}
	});
}

export const open_the_1_leaf_polytope = ({
	name = ""
}) => {
	modal_store.trigger ({
		type: 'component',
		
		backdropClasses: '!p-0',
		
		component: {
			ref: Polytope_1_Leaf,
			props: { 
				modal_store,
				name
			}
		}
	});
}


</script>

<div>
	<button 
		on:click={ open_the_polytope }
	
		type="button" 
		class="btn variant-filled"
	>Open Polytope</button>
	
	<button 
		on:click={ open_the_1_leaf_polytope }
	
		type="button" 
		class="btn variant-filled"
	>Open 1 Leaf Polytope</button>
</div>