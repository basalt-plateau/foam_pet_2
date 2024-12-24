

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
			position: relative;
		
			font-size: 1.3em;
			padding: 0.25cm 2cm;
			
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			
			height: 2cm;
			width: 7cm;
			
			overflow: hidden;
			
			border: 2px solid black;
		"
	>
		<div
			style="
				position: absolute;
			
				display: flex;
				align-items: center;
				justify-content: center;
				gap: 0.25cm;
				
				height: 100%;
				width: 100%;
					
				font-size: 1em;
				
				background: radial-gradient(#f9f9f9bd, #ffffff05);
			"
		>
			<img 
				src="/Merci/Mercy.svg" 
				style="
					width: 1.5cm;
					height: 1.5cm;							
				"
			/>
			<p>Mercy</p>
		</div>
	</button>
</div>
