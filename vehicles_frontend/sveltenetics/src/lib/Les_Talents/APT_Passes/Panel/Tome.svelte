

<script>


	


////
//
//
import Polytope_2 from '$lib/trinkets/Polytope_2/Tome.svelte'
//
////

import Leaf from "./Leaf/Tome.svelte"
import { parse_styles } from '$lib/trinkets/styles/parse'




	
let polytope_modal;


let prepared = "no"
const on_polytope_2_prepare = () => {
	prepared = "yes"
}


</script>


<Polytope_2 
	bind:this={ polytope_modal }
	on_prepare={ on_polytope_2_prepare }
	style={parse_styles ({
		width: "100vw",
		height: "100vh"
	})}
>
	<div 
		style="
			height: 100%;
			width: 100%;
		"
	>
		{#if prepared === "yes" }
		<Leaf />
		{/if}
		
		<div style="height: 12cm" />	
	</div>
</Polytope_2>