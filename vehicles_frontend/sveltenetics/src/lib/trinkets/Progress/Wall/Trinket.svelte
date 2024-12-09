


<script>


/*
	import Progress_Wall from '$lib/trinkets/Progress/Wall/Trinket.svelte'
	<Progress_Wall show={ "yes" } />
*/

import Eternal_1_Progress from '$lib/trinkets/Progress/Eternal_1/Trinket.svelte'

let show = "yes"

</script>

<style>

[progress_wall] { @apply bg-surface-50-900-token; }

</style>

{#if show === "yes" }
<div
	progress_wall
	style="
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		
		display: flex;
		justify-content: center;
		align-items: center;
	"
>
	<Eternal_1_Progress 
		height={ "100px" }
		width={ "100px" }
		color={ "#000000" }
	/>
</div>
{/if}