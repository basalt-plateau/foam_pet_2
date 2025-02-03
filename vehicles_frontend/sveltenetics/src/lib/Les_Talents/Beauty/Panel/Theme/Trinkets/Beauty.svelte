



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

//
import { onMount, onDestroy } from 'svelte'
import { LightSwitch } from '@skeletonlabs/skeleton';
import { SlideToggle } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
import { modeOsPrefers, modeUserPrefers, modeCurrent } from '@skeletonlabs/skeleton';
import { getModeOsPrefers, getModeUserPrefers, getModeAutoPrefers } from '@skeletonlabs/skeleton';
import { setModeUserPrefers, setModeCurrent } from '@skeletonlabs/skeleton';
//
//
import Seeds_Trucks from '$lib/Versies/Trucks.svelte'
import { check_roomies_truck } from '$lib/Versies/Trucks'
import Versies_Truck from '$lib/Versies/Trucks.svelte'
//
//


let VF = false;
let visibility = $modeCurrent || true;
let theme = ""
let mounted = "no"
$: {
	let _theme = theme;
	change_tints ({ theme })
}
const change_tints = ({ theme: _theme }) => {
	if (typeof _theme === 'string' && _theme.length >= 1) {
		localStorage.setItem ('body-theme', _theme);
		document.body.setAttribute ('data-theme', _theme)
		theme = _theme;
	}	
}


const Options = [
	"Atolls",
	"Bayanihan",
	"Domes",
	"Gauze",
	"Hacienda",
	"HD 40307g",
	"Lentils",
	"Motto",
	"PTO",
	"Rhubarb"
]

/*
	This is for learning the name of the theme.
	
*/
const ask_for_theme = () => {
	let body_theme = document.body.getAttribute ('data-theme') 
	if (typeof body_theme === "string" && body_theme.length >= 1) {
		return body_theme;
	}
	
	return ''
}




onMount (() => {
	let theme = ask_for_theme ()
	
	if (typeof theme === 'string' && theme.length >= 1) {
		change_tints ({ theme });
	}
	
	if (typeof $modeCurrent === "boolean") {
		visibility = $modeCurrent;
	}
	
	mounted = "yes"
});



const change_visibility = () => {
	$modeCurrent = visibility;
	setModeUserPrefers ($modeCurrent);
	setModeCurrent ($modeCurrent);
}

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
	<Versies_Truck on_change={ ({ freight }) => { VF = freight } } />
	{#if typeof VF === "object"}
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
		>Hues</header>
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
		<div>Improv</div>
		<!-- Nocturnal, Show, Dark, Theater -->
		<!-- Show, Theater, Jam Session, Improv -->
		<!-- Techno, Twerk  -->

		<!-- <LightSwitch /> -->
		<SlideToggle name="slide" bind:checked={ visibility } on:change={ change_visibility } />
		
		<div>Voltaics</div>
		<!-- Diurnal, Voltaics, Matinee, Tropical -->
		<!-- Constellation, Luminescence, Lazers -->
	</div>
	
	<div style="height: 0.2cm"></div>
	
	<select 
		bind:value={theme}
		class="select"
	>
		{#each Options as name, index}
		<option value={ name }>{ name }</option>
		{/each}
	</select>
	
	{#if false}
	<RadioGroup 
		flexDirection={ VF.window_width <= 1000 ? 'flex-col' : 'row'}
		rounded={ VF.window_width <= 1000 ? 'rounded-container-token' : 'rounded-token'}
	>
		<RadioItem bind:group={theme} name="justify" value="Atolls">Atolls</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="Domes">Domes</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="Gauze">Gauze</RadioItem>		
		<RadioItem bind:group={theme} name="justify" value="Hacienda">Hacienda</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="HD 40307g">HD 40307g</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="Lentils">Lentils</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="Motto">Motto</RadioItem>	
		<RadioItem bind:group={theme} name="justify" value="PTO">PTO</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="rhubarb">Rhubarb</RadioItem>
	</RadioGroup>
	{/if}

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