
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
		bind:sound_gem={ sound_gem }
		source="/sonors/Beep/Beep.ogg"
	/>

	
*/

import { onMount } from 'svelte'

export let source = ""
export let sound_gem = ""

onMount (() => {
	sound_gem.play ();
})

</script>

<audio 
	bind:this={ sound_gem }
>
	<source src={ source } type="audio/ogg">
	This browser does not support the audio element.
</audio>