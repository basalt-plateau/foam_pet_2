

<script>

//\\
//
//
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
//
//
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Signature_Ownership from '$lib/PTO/Accounts/Trinkets/Signature_Ownership/Trinket.svelte'
import Signature_Math from '$lib/PTO/Accounts/Trinkets/Signature_Math/Trinket.svelte'
//
//
import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'
import { parse_styles } from '$lib/trinkets/styles/parse.js';
//
//
////

</script>




<div class="card p-4">
	<header
		style="{parse_styles ({
			'display': 'flex',
			'text-align': 'center',
			'font-size': '2em',
			'justify-content': 'center'
		})}"
	>Notes</header>

	<div style="height: 0.25cm" />	

	<Signature_Ownership />
	
	<div style="height: 0.25cm" />	

	<Signature_Math />	
</div>

