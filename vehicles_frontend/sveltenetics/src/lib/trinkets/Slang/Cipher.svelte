


<script>

/*
	import Slang_Cipher from '$lib/trinkets/Slang/Cipher.svelte'
	<Slang_Cipher />
*/

/*
	Original:
		Traditional:

*/

////
//
import { onMount } from 'svelte'
import nlp from 'compromise/one'
//
//
import { has_field } from '$lib/taverns/procedures/object/has_field'
//
//
import { nocturnalize } from './screenplays/nocturnalize'
import { Centaurus_A } from './jargons/Centaurus_A/index.js'
//
////

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

const organized = organize_slang (Centaurus_A)

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
