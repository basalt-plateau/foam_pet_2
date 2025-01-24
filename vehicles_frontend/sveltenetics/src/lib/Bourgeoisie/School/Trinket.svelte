


<script>

//\\
//
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
//
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Offline_Signing_Example from '$lib/trinkets/Hints/Offline_Signing_Example/Trinket.svelte'
//
//
import { parse_styles } from '$lib/trinkets/styles/parse.js';
//
////

import Boards from './Boards/Board.svelte'
import Topical from './Topical/Tome.svelte'
import Levels from './Levels/Board.svelte'

let leaf = "Topical";

</script>



<Leaf>
	<div
		style="
			position: relative;
			top: 0;
			left: 0;
			
			width: 100%;
			
			text-align: center;
			
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
		"
	>
		<div>
			<RadioGroup>
				<RadioItem bind:group={ leaf } name="justify" value={ "Topical" }>Topical</RadioItem>
				<RadioItem bind:group={ leaf } name="justify" value={ "Levels" }>Levels</RadioItem>				
				<RadioItem bind:group={ leaf } name="justify" value={ "Boards" }>Boards</RadioItem>		
			</RadioGroup>
		</div>
	</div>
	
	{#if leaf === "Topical"}
	<Topical />
	{:else if leaf === "Boards" }
	<Boards />
	{:else if leaf === "Levels" }
	<Levels />
	{/if}

	<div style="height: 5cm"></div>

</Leaf>