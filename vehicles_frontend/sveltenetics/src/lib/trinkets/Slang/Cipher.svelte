


<script>

/*
	import Slang_Cipher from '$lib/trinkets/Slang/Cipher.svelte'
	<Slang_Cipher />
*/

/*
	Original:
		Traditional:

*/

import { has_field } from '$lib/taverns/procedures/object/has_field'
import { onMount } from 'svelte'
import nlp from 'compromise/one'
import { nocturnalize } from './screenplays/nocturnalize'

import { American_1 } from './jargons/American_1'
import { Reals } from './jargons/Reals'


const organize_slang = (bracket) => {
	const sorted_by_keys = Object.keys (bracket).sort((a, b) => {
		return a.toLowerCase ().localeCompare (b.toLowerCase ());
	});
	
	const organized = {};
	for (const key of sorted_by_keys) {
		organized [key] = bracket [key];
	}
	
	return organized
}

const organized = organize_slang (Reals)

console.log ({ organized })

</script>


<div class="table-container text-token">
	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 50%">Original</th>
				<th style="width: 50%">Slang</th>
			</tr>
		</thead>
		<tbody>
			{#each Object.entries (organized) as [ saying, equivalent ]}
				<tr>
					<td>{ saying }</td>
					<td>{ equivalent }</td>
				</tr>
			{/each}
		</tbody>
	</table>
</div>
