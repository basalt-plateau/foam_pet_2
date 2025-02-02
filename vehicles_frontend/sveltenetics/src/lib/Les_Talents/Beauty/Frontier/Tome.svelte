

<script>

/*
	import Beauty_Frontier from "$lib/Les_Talents/Beauty/Frontier/Tome.svelte"
*/

/*
	Frontier, Event Horizon, Opener
*/

import { Modal, getModalStore } from '@skeletonlabs/skeleton';
const modal_store = getModalStore ();

export let style = "";


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

import { parse_styles } from '$lib/trinkets/styles/parse'
const style_2 = parse_styles (Object.assign ({}, {
	display: 'flex',
	'flex-direction': 'column',
	'justify-content': 'center',
	'align-items': 'center',
	
	padding: '0.1cm 0',
	
	'white-space': 'break-spaces'
}, style))


</script>


<button 
	monitor="glyph for adaptation"
	
	on:click={ open }
	type="button" 
	class="btn bg-gradient-to-br variant-gradient-primary-secondary"
	style="
		position: relative;

		font-size: 1.3em;
		padding: 16px 44px;
		
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		
		border-top-left-radius: 35px;
		border-bottom-left-radius: 10px;
		border-top-right-radius: 10px;
		border-bottom-right-radius: 39px;
		
		background: radial-gradient(
			rgb(var(--color-primary-500)), 
			rgb(var(--color-secondary-500)),
			rgb(var(--color-secondary-400)),
			rgb(var(--color-secondary-600))
		);
	"
>
	<div
		style="
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			
			background: linear-gradient(
				22deg,
				rgb(var(--color-primary-500)), 
				rgb(var(--color-secondary-500)),
				rgb(var(--color-secondary-400)),
				rgb(var(--color-secondary-600))
			);
			
			border-top-left-radius: 35px;
			border-bottom-left-radius: 10px;
			border-top-right-radius: 10px;
			border-bottom-right-radius: 39px;
			
			opacity: 0.5;
		"
	></div>
	<p
		style="
			position: relative;
		"
	>Beauty</p>
</button>
