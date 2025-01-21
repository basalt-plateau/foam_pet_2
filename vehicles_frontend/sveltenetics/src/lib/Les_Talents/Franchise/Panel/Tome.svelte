

<script>


	


////
//
//
import Polytope_2 from '$lib/trinkets/Polytope_2/Tome.svelte'
//
////
import Franchise from './Franchise/Tome.svelte';


	
let polytope_2_modal;
let polytope_2_prepared = "no"


</script>


<Polytope_2 
	bind:this={ polytope_2_modal }
	on_prepare={() => {
		polytope_2_prepared = "yes"
	}}
>
	{#if polytope_2_prepared === "yes" }
	<Franchise />
	{/if}
</Polytope_2>