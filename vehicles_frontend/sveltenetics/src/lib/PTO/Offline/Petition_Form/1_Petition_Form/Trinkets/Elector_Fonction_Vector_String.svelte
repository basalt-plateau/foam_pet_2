

<script>
import { InputChip } from '@skeletonlabs/skeleton';

export let on_change = () => {}

let parameter_elected = [];
$: {
	let _parameter_elected = parameter_elected;
	on_change ({ contents: parameter_elected });
}

</script>

<div>
	<InputChip 
		bind:value={ parameter_elected } 
		name="chips" 
		placeholder="" 
		allowUpperCase={ true }
		allowDuplicates={ true }
	/>

</div>