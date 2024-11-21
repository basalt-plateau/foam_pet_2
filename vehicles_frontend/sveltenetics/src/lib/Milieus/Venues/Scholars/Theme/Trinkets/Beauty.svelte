



<script>


/*
	Themes:
		tailwind.config.js

	Original (Arrival) Theme:
		src/app.html
		
	Order:
		The themes are in alphabeticalish order
		by last glyph.
*/

import { onMount, onDestroy } from 'svelte'
import { LightSwitch } from '@skeletonlabs/skeleton';
import { SlideToggle } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import { modeOsPrefers, modeUserPrefers, modeCurrent } from '@skeletonlabs/skeleton';
import { getModeOsPrefers, getModeUserPrefers, getModeAutoPrefers } from '@skeletonlabs/skeleton';
import { setModeUserPrefers, setModeCurrent } from '@skeletonlabs/skeleton';

import Seeds_Trucks from '$lib/Versies/Trucks.svelte'
import { check_roomies_truck } from '$lib/Versies/Trucks'


let window_width = 0;
let is_vertical = true;

let seeds_freight = {}
let seeds_trucks_prepared = "no"
const on_seeds_truck_change = ({ freight: _freight, happening }) => {
	seeds_freight = _freight;
	if (happening === "mounted") {
		seeds_trucks_prepared = "yes"
	}
	
	window_width = _freight.window_width;
	if (window_width <= 800) {
		is_vertical = true;
	}
	else {
		is_vertical = false;
	}
}

/*
	Theme is part of 
*/
let theme = ""
let mounted = "no"
$: {
	let _theme = theme;
	change_tints ({ theme })
}
const change_tints = ({ theme: _theme }) => {
	console.log ("change_tints:", _theme)
	
	if (typeof _theme === 'string' && _theme.length >= 1) {
		localStorage.setItem ('body-theme', _theme);
		document.body.setAttribute ('data-theme', _theme)
		theme = _theme;
		
		console.log ({ _theme })
	}	
}


/*
	Perhaps this is for checking if there is already
	a theme picked.
*/
const ask_for_theme = () => {
	
	/*
		prefer a theme that is set in local storage
	*/
	let local_storage_theme = localStorage.getItem ('body-theme');
	if (
		typeof local_storage_theme === "string" &&
		local_storage_theme.length >= 1
	) {
		return local_storage_theme;
	}
	
	let body_theme = document.body.getAttribute ('data-theme') 
	if (
		typeof body_theme === "string" &&
		body_theme.length >= 1
	) {
		return body_theme;
	}
	
	return ''
}


onMount (() => {
	let theme = ask_for_theme ()
	
	if (typeof theme === 'string' && theme.length >= 1) {
		change_tints ({ theme });
	}
	
	mounted = "yes"
});



let visibility = $modeCurrent || false;
const change_visibility = () => {
	// console.log ("change_visibility:", { visibility });
	$modeCurrent = visibility;
	setModeUserPrefers ($modeCurrent);
	setModeCurrent ($modeCurrent);
}

/*
$: {
	let _visibility = visibility;
	change_visibility ();	
}
*/



</script>


<div
	class="card p-4"
	style="
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	"
>
	<Seeds_Trucks on_change={ on_seeds_truck_change } />
	
	{#if seeds_trucks_prepared === "yes"}



	<div
		class="card p-2 variant-soft-surface"
		style="
			padding: 0.2cm 1cm;
			margin: 0.2cm 0 0.5cm;
		"
	>
		<header
			style="
				font-size: 1.4em;
				line-height: 100%;
			"
		>Beauty</header>
	</div>
	
	<div style="width: 10px"></div>
	<div
		class="card p-2 variant-filled-primary"
		style="
			display: flex;
			align-items: center;
			justify-content: center;
			gap: 8px;
		"
	>
		<div>Nocturnal</div>

		<!-- <LightSwitch /> -->
		
		<SlideToggle name="slide" bind:checked={ visibility } on:change={ change_visibility } />
		
		<div>Diurnal</div>
	</div>
	
	<div style="height: 0.2cm"></div>
	
	<RadioGroup 
		flexDirection={is_vertical ? 'flex-col' : 'row'}
		rounded={is_vertical ? 'rounded-container-token' : 'rounded-token'}
	>
		<RadioItem bind:group={theme} name="justify" value="Atolls">Atolls</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="Domes">Domes</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="Gauze">Gauze</RadioItem>		
		<RadioItem bind:group={theme} name="justify" value="Hacienda">Hacienda</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="Motto">Motto</RadioItem>	
		<RadioItem bind:group={theme} name="justify" value="PTO">PTO</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="rhubarb">Rhubarb</RadioItem>
	</RadioGroup>

	<div style="height: 0.2cm"></div>

	<div class="card p-4 variant-soft-surface" style="width: 100%">
		<div
			class="card p-2 variant-soft-surface"
			style="
				padding: 0.2cm 1cm;
				max-width: 250px;
				
				margin: 0 auto 0.25cm;
			"
		>
			<header
				style="
					font-size: 1.4em;
					line-height: 100%;
					text-align: center;
					
				"
			>Examples</header>
		</div>
		
		<div
			style="
				display: grid;
				grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
				grid-template-rows: auto;
				gap: 10px;
				
				width: 100%;
			"
		>
			<div class="card p-4 variant-filled-success">Success</div>
			<div class="card p-4 variant-filled-warning">Caution</div>
			<div class="card p-4 variant-filled-error">Problem</div>
			<div class="card p-4 variant-filled-surface">Surface</div>
			<div class="card p-4 variant-filled-primary">Primary</div>
		</div>
	</div>
	{/if}
</div>