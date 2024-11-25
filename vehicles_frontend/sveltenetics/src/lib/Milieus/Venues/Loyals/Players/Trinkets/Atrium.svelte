

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
	<div style="height: 2cm" />

	<header
		style="{parse_styles ({
			'display': 'flex',
			'text-align': 'center',
			'font-size': '2em',
			'justify-content': 'center'
		})}"
	>
		<Slang text="Accounts" /> 
	</header>
	
	
	<div style="height: 1cm" />
	
	<p
		style="
			text-align: center;
		"
	><Slang text="Accounts" /> each have 1 <Slang text="Private Key" /> that has 1 or more <Slang text="Addresses" />.</p>
	
	<div style="height: 0.5cm" />
	
	<p
		style="
			text-align: center;
		"
	><Slang text="A_Private_Key" /> is necessary to act as <Slang text="an_Address" />.</p>

	<div style="height: 0.5cm" />	
</div>

<div style="height: 0.5cm" />

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

