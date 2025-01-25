

<script>


	


////
//
//
import Polytope_2 from '$lib/trinkets/Polytope_2/Tome.svelte'
import { parse_styles } from '$lib/trinkets/styles/parse'
//
//
////


	
let polytope_2_modal;
let polytope_2_prepared = "no"


</script>


<Polytope_2 
	bind:this={ polytope_2_modal }
	on_prepare={() => {
		polytope_2_prepared = "yes"
	}}
	style={{
		width: "100vw",
		height: "100vh"
	}}
>
	{#if polytope_2_prepared === "yes" }
		

	{/if}
</Polytope_2>