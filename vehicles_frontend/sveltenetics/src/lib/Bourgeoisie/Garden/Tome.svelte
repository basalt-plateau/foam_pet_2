






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
import Installation_with_Linux from './Linux/Tome.svelte'
//
///

const releases = "https://github.com/Planet-IV";

import Linux_Tome from "./Linux/Tome.svelte"

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

<Leaf>
	<div style="height: 0.5cm"></div>
	<div class="card p-4">
		<div style="height: 0.5cm"></div>
		<header 
			style="
				display: none;
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
		
		<Linux_Tome />
		
		<div style="height: 0.5cm"></div>
		
		<div
			style="display: none;"
		>
			
			<p
				style="
					text-align: center;
					width: 500px;
					text-align: center;
					margin: 0 auto;
				"
			>The entire domain <Slang text="this_domain" /> cannot be obtained and run as a Linux dapp at this time.</p>
			
			<div style="height: 0.5cm"></div>
			
			<p
				style="
					text-align: center;
					width: 500px;
					text-align: center;
					margin: 0 auto;
				"
			>Please check later.</p>
			
			<div
				style="
					display: none;
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
	</div>
	
	<div style="height: 0.5cm"></div>
</Leaf>
