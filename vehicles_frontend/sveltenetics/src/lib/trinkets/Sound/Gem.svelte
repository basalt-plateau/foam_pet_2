
<script>
/*
	import Sound_Gem from '$lib/trinkets/Sound/Gem.svelte'
	let sound_gem = ""
	$:{
		if (typeof sound_gem === "object") {
			sound_gem.pause();
			sound_gem.currentTime = 0;
			sound_gem.play ();
		}
	}
	
	<Sound_Gem 
		bind:this={ sound_gem }
		source="/sonors/Beep/Beep.ogg"
	/>
	
	sound_gem.playa ();
	
*/



import { onMount } from 'svelte'

export let source = ""

let show_gem = ""

export const playa = () => {
	if (show_gem) {
		show_gem.pause ();
		show_gem.currentTime = 0;
		show_gem.volume = 1;
		show_gem.play ();
	}
	else {
		console.error ("The audio show gem could not be found.");
	}
}

onMount (() => {
	// playa ();
})

</script>

<audio bind:this={ show_gem } >
	<source src={ source } type="audio/ogg">
	This browser does not support the audio element.
</audio>