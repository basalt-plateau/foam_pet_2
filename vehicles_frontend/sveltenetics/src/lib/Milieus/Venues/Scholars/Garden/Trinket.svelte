




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

let Cherokee_Friends = {
	name: (
		"ᎩᎦᎨᎢᎦᎯ"
	),
	language: (
		"Cherokee"
	),
	pronunciation: (
		"Gigageiha"
	)
}

/*
	https://language.cherokee.org/media/vdiic5hr/2024consortium.pdf
	https://www.cherokeedictionary.net/
*/
let Cherokee_Garden = {
	name: (
		"ᎠᏫᏒᏅ"
	),
	language: (
		"Cherokee"
	),
	pronunciation: (
		"awisvnv"
	),
	english: (
		"Garden"
	)
}
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
				font-size: 2em; 
				text-align: center;
			"
		>{ Cherokee_Garden.name }</header>
		<div style="height: 0.5cm"></div>
		
		
		<div
			class="card p-1 variant-soft-surface"
			style="
				width: 100%;
			"
		>
			<p
				style="
					text-align: center;
				"
			><b>{ Cherokee_Garden.name }</b>, perhaps occassionally pronounced <b>{ Cherokee_Garden.pronunciation }</b>,</p>
			<p
				style="
					text-align: center;
				"
			>might be the <b>{ Cherokee_Garden.language }</b> sound for <b>{ Cherokee_Garden.name }</b>.</p>
		</div>
		
		<div style="height: 0.5cm"></div>
		
		<p
			style="
				text-align: center;
			"
		>A <Slang text="Pet" /> can be adopted from these.</p>
		
		
		<div style="height: 0.5cm"></div>
	</div>
	
	<div style="height: 0.5cm"></div>

	<Installation_with_Linux />
	
	<div style="height: 0.5cm"></div>

	<Installation_with_Docker />
	
	<div style="height: 3cm"></div>
</Leaf>
