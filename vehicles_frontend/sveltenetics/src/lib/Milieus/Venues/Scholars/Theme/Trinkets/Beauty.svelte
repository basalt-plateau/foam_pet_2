



<script>


import { onMount, onDestroy } from 'svelte'
import { LightSwitch } from '@skeletonlabs/skeleton';
import { SlideToggle } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import { modeOsPrefers, modeUserPrefers, modeCurrent } from '@skeletonlabs/skeleton';
import { getModeOsPrefers, getModeUserPrefers, getModeAutoPrefers } from '@skeletonlabs/skeleton';
import { setModeUserPrefers, setModeCurrent } from '@skeletonlabs/skeleton';

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


const ask_for_theme = () => {
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
	
	change_tints ({ 
		theme
	});
	mounted = "yes"
});



let visibility = $modeCurrent || false;
const change_visibility = () => {
	// console.log ("change_visibility:", { visibility });
	$modeCurrent = visibility;
	setModeUserPrefers ($modeCurrent);
	setModeCurrent ($modeCurrent);
}
$: {
	let _visibility = visibility;
	change_visibility ();	
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
		
		<SlideToggle name="slide" bind:checked={ visibility } />
		
		<div>Diurnal</div>
	</div>
	
	<div style="height: 0.2cm"></div>
	
	<RadioGroup>
		<RadioItem bind:group={theme} name="justify" value="Atolls">Atolls</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="PTO">PTO</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="rhubarb">Rhubarb</RadioItem>
		<RadioItem bind:group={theme} name="justify" value="Hacienda">Hacienda</RadioItem>
	</RadioGroup>
</div>