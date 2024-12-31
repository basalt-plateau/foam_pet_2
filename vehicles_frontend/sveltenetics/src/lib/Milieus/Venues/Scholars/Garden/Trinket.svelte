




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
import Installation_with_Linux from './Linux/Trinket.svelte'
//
///

const releases = "https://github.com/basalt-plateau";

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

	<div style="height: 0.5cm"></div>
	<div class="card p-4">
		<div style="height: 0.5cm"></div>
		<header 
			style="
				font-size: 3em; 
				text-align: center;
			"
		>Garden</header>

		<p
			style="
				text-align: center;
				width: 500px;
				text-align: center;
				margin: 0 auto;
			"
		>The entire domain <Slang text="this_domain" /> can be obtained and run as a Linux dapp.</p>
		
		<div style="height: 0.5cm"></div>
		
		<div
			style="
				text-align: center;
			"
		>
			<a 
				href={ releases } 
				target="_blank" 
				class="anchor"
				style="
					text-decoration: none;
				"
			>
				<span>{ releases }</span>
			</a>
		</div>
		
		<div style="height: 0.5cm"></div>
	</div>
	
	<div style="height: 0.5cm"></div>

	<!-- <Installation_with_Linux /> -->
	
	<div style="height: 0.5cm"></div>

	<!-- <Installation_with_Docker /> -->
	
	<div style="height: 3cm"></div>
</Leaf>
