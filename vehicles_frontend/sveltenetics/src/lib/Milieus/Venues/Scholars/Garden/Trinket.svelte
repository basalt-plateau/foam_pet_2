




<script>

/*
	@ Wild
		@ Saves
		@ Products
		
		@ mixes
			@ songs
			
		@ goods
			
		@ merch
			@ merchandise
*/

//\
//
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import Installation_with_Docker from './Docker/Trinket.svelte'

</script>

<style>

@media (max-width: 600px) {
    .latest-block-panel {
		flex-direction: column !important;
	}
}
a {
	line-height: 110%;
}

</style>

<svelte:head>
	<title>Garden</title>
	<meta name="description" content="Garden" />
</svelte:head>

<Leaf>
	<div>		
		<div class="card p-4">
			<div style="height: 0.5cm"></div>
			<header 
				style="
					font-size: 2em; 
					text-align: center;
				"
			>Garden</header>
			<div style="height: 0.5cm"></div>
			<p
				style="
					text-align: center;
				"
			>A <Slang text="Pet" /> can be adopted from here.</p>
			<div style="height: 0.5cm"></div>
		</div>
		
		<div style="height: 0.5cm"></div>
	
		<Installation_with_Docker />
		
		<div style="height: 3cm"></div>
	</div>
</Leaf>
