

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
		height: "100vh",
	}}
>
	{#if polytope_2_prepared === "yes" }
	<div
		style="
			width: 100vw;
			max-width: 1000px;
			height: 100vh;
			margin: 0 auto;
			
			display: flex;
			gap: 0.25cm;
			flex-direction: column;
		"
	>
		<div class="card p-2">
			<header
				style="
					font-size: 1.5em;
					font-weight: bold;
					text-align: center;
				"
			>Dittoing</header>
			<p>This is an on chain web3 dapp that is dittoed by lots of decentralized nodes.</p>
			<p>As such, by sending, you accept that every node is allowed to make exact or derivative dittos of your text.</p>
		</div>
	
		<div class="card p-2">
			<header
				style="
					font-size: 1.5em;
					font-weight: bold;
					text-align: center;
				"
			>Censorship</header>
			<p>Please make sure texts & platform names are appropriate for most audiences.</p>
			<p>At present, given the nascency of the dapp, to ensure the chillness of the dapp, texts & platforms can be deleted at any time, for any reason, by the rulership.</p>
			<p>If deleted, any sort of refund is at the discretion of the rulership.  Thus a full refund, partial refund, or zero refund might be sent depending on the unappropriateness of the content.</p>
		</div>
		
		<div class="card p-2">
			<header
				style="
					font-size: 1.5em;
					font-weight: bold;
					text-align: center;
				"
			>Translations</header>
			<p>By sending, you accept that the text can be translated into any language with indication that the translation might be lossy.</p>
		</div>
	</div>
	{/if}
</Polytope_2>