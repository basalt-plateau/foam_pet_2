



<script>

//
//	https://schum123.github.io/svelte-loading-spinners/
//


///
//
import Unfinished from './Trinkets/Unfinished.svelte'
//
//
import Eternal_1_Progress from '$lib/trinkets/Progress/Eternal_1/Trinket.svelte'
//
//
import { onMount } from 'svelte'
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
import { ConicGradient } from '@skeletonlabs/skeleton';
//
//\

//
const modal_store = getModalStore ();

$: freight = {
	showing: 'yes',
	name: '',
	close: () => {
		console.info ('close_the_modal')
		modal_store.close ();
	}
}


const close_the_waiting_modal = () => {
	console.info ('close_the_waiting_modal')
	freight.unfinished.showing = "no"
}



onMount (() => {})

let wait_color = document.documentElement.classList.contains ("dark") ? "#000000" : "#FFFFFF";

</script>



<div 
	style="
		position: relative;
		top: 0;
		left: 0;
		padding: 0;
		
		width: 100vw;
		height: 100vh;

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
	
	{#if freight.showing === "yes" }
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
			<slot name="leaves"></slot>
		</div>
		<div style="height: 70px" />
	</div>
	{:else}
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
			justify-content: center;
			align-items: center;
		"
	>
		<div>	
			<div style="height: 2cm" />
			<div
				style="
					height: 1cm;
					width: 1cm;
				"
			>
				<Eternal_1_Progress 
					height={ "60px" }
					width={ "60px" }
					color={ wait_color }
				/>
			</div>
		</div>
	</div>
	{/if}


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
