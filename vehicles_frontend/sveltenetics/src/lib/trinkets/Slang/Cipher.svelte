


<script>

/*
	import Slang_Cipher from '$lib/trinkets/Slang/Cipher.svelte'
	<Slang_Cipher />
*/

import { has_field } from '$lib/taverns/procedures/object/has_field'
import { onMount } from 'svelte'
import nlp from 'compromise/one'
import { nocturnalize } from './screenplays/nocturnalize'

import { American_1 } from './jargons/American_1'


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

const organized = organize_slang (American_1)

console.log ({ organized })

</script>


<div>
	<div class="table-container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 6cm">Slang</th>
					<th>Original</th>
				</tr>
			</thead>
			<tbody>
				{#each Object.entries (organized) as [ saying, equivalent ]}
					<tr>
						<td>{ equivalent }</td>
						<td>{ saying }</td>
					</tr>
				{/each}
			</tbody>
		</table>
	</div>
</div>