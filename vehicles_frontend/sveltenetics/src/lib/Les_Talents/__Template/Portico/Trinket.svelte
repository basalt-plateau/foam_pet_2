

<script>




export let modal_store;

let open = async () => {
	modal_store.trigger ({
		type: 'component',
		backdropClasses: '!p-0',
		component: {
			ref: (await import ('./../Panel/Trinket.svelte')).default,
			props: { 
				modal_store
			}
		}
	});
}




</script>


<div class="relative inline-block">
	<button 
		monitor="glyph for adaptation"
		
		on:click={ open }
		type="button" 
		class="btn bg-gradient-to-br variant-gradient-primary-secondary"
		style="
			font-size: 1.3em;
			padding: 12px 54px;
			margin-top: 10px;
			
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		"
	>
		<p>Talent</p>
	</button>
</div>
