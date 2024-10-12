
<script>

/*
	import Radial_Progress from '$lib/trinkets/Progress/Radial/Trinket.svelte'
	<div
		style="
			position: absolute;
			top: 10px;
			left: 10px;
		"
	>		
		<Radial_Progress />
	</div>
*/

import { ProgressRadial } from '@skeletonlabs/skeleton';

// 'rgb(var(--color-primary-500))'

// const fill = 'rgb(var(--color-primary-500))'
const fill = '#FFF'

</script>

<div>
	<ProgressRadial 
		value={ undefined } 
		width="w-5"
		fill={ fill }
		stroke="90"
		strokeLinecap="round"
	/>
</div>