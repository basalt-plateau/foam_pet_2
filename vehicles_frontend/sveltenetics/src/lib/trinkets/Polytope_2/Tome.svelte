





<script>

/*
	import Polytope_2 from '$lib/trinkets/Polytope_2/Tome.svelte'
	let polytope_2_modal;
	let polytope_2_prepared = "no"

	<Polytope_2 
		bind:this={ polytope_2_modal }
		on_prepare={() => {
			polytope_2_prepared = "yes"
		}}
	>
		{#if polytope_2_prepared === "yes" }
			

		{/if}
	</Polytope_2>
*/

/*
	import { Modal, getModalStore } from '@skeletonlabs/skeleton';
	const modal_store = getModalStore ();


	let open = async () => {
		modal_store.trigger ({
			type: 'component',
			backdropClasses: '!p-0',
			component: {
				ref: (await import ('./../Panel/Tome.svelte')).default,
				props: { 
					modal_store
				}
			}
		});
	}
*/

//
//	https://schum123.github.io/svelte-loading-spinners/
//

////
//
//
import { onMount } from 'svelte'
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
//
////

const modal_store = getModalStore ();

$: freight = {
	name: '',
	close: () => {
		modal_store.close ();
	}
}

export let on_prepare = () => {};

onMount (() => {
	on_prepare ()
})


</script>



<div 
	style="
		position: relative;
		top: 0;
		left: 0;
		padding: 0;
		
		width: 80vw;
		height: 80vh;

		overflow-y: scroll;
	"
>
	<div
		class="bg-surface-50-900-token border border-primary-500/30"
		style="
			display: flex;
			
			position: absolute;
			top: 0;
			left: 0;
			height: 100%;
			width: 100%;
			border-radius: 8px;
			
			overflow: hidden;
			
			flex-direction: column;
		"
	>
		<div
			style="
				display: flex;
				justify-content: center;
				flex-direction: column;
				height: 50px;
			"
		>
			<header
				style="
					padding: 0.2cm 0;
					text-align: center;
					font-size: 1.2em;
				"
			>{ freight.name }</header>
			<hr class="!border-t-2" />
		</div>
	</div>
	
	<div
		style="
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			width: 100%;
			
			box-sizing: border-box;
			padding: 0 10px 0;
			
			overflow: scroll;
			
			display: flex;
			flex-direction: column;
			justify-content: space-between;
		"
	>
		<div style="height: 50px" />	
		<div
			style="
				height: 100%;
				overflow-y: scroll;
			"
		>
			<slot></slot>
		</div>
		<div style="height: 70px" />
	</div>

	<footer
		class="bg-surface-50-900-token border border-primary-500/30"
		style="
			position: absolute;
			bottom: 0;
			left: 0;
			width: 100%;
			height: 70px;
			border-radius: 8px;
			
		"
	>
		<hr class="!border-t-2" />
		
		<div 
			class="modal-footer"
			style="
				display: flex;
				align-items: center;
				justify-content: space-between;
			
				position: absolute;
				bottom: 0;
				left: 0;
				width: 100%;
				padding: 10px;
			"
		>
			<button 
				class="btn variant-filled" 
				on:click={ freight.close }
			>
				Exit
			</button>
		</div>
	</footer>
</div>
