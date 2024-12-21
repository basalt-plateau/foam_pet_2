




# Polytope

## Structure
Polytop_Modal.svelte is the structure.



## Possibilities
### Opener
const open_coin_transfer = () => {
	modal_store.trigger ({
		type: 'component',
		component: {
			ref: Friends_Move_Coin_Transfer_G1,
			props: { 
				modal_store
			}
		}
	});
}


import Polytope from '$lib/trinkets/Polytope/Polytope_Modal.svelte'

let polytope_modal;
const on_click = () => {
	polytope_modal.advance (({ freight }) => {
		freight.name = "panel"
		return freight;
	})
}
			

					

<Polytope 
	bind:this={ polytope_modal }
	on_change={ on_modal_change }
	on_prepare={ on_prepare }
>
	<div slot="leaves">
		{#if current === 1}
		<div>
			<div>leave 1</div>
			
			<button 
				on:click={ on_click }
				
				type="button" 
				class="btn variant-filled"
			>Button</button>
		</div>
		{:else if current === 2}
		<div>
			<div>leave 2</div>
			
			<button 
				on:click={ on_click }
				
				type="button" 
				class="btn variant-filled"
			>Button</button>
		</div>
		{/if}
	</div>
	
	<div slot="unfinished">
		<div>
			This is unfinished
		</div>
	</div>
</Polytope>


