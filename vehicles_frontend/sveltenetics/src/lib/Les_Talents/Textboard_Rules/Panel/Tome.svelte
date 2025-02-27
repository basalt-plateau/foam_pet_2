

<script>


	


////
//
//
import Polytope_2 from '$lib/trinkets/Polytope_2/Tome.svelte'
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
	<header>Censorship</header>
	<p>At present, given the nascency of the dapp, to ensure the chillness of the dapp, texts & platforms can be deleted at any time, for any reason, by the producer.</p>
	<p>Please make sure texts & platform names are dappropriate for most audiences.</p>
	{/if}
</Polytope_2>