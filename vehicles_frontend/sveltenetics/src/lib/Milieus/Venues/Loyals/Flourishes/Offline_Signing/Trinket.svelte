
<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'

const form_petition = '/pictures/orbital/form_petition.svg';
const send_petition = '/pictures/orbital/send_petition.svg';
const form_signature = '/pictures/orbital/form_signature.svg';
const send_signature = '/pictures/orbital/send_signature.svg';
const form_note = '/pictures/orbital/form_note.svg';

import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import Offline_Signing_Example from '$lib/trinkets/Hints/Offline_Signing_Example/Trinket.svelte'


</script>


<div class="card p-4">
	<div class="card p-1 variant-filled-soft">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div
						style="
							text-align: center;
							font-size: 1.5em;
						"
					>
						<p>Hints</p>
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div style="height: 0.25cm"></div>
				
					<p
						style="font-size: 1em; text-align: center"
					>
						<span><Slang text="Signatures" /> show that <Slang text="an_Account" /> endorses a <Slang text="Petition" />.</span>			
					</p> 

					<p
						style="font-size: 1em; text-align: center; margin: 0;"
					>
						<span>An <Slang text="Offline Machine" /> can communicate with an <Slang text="Online Machine" /> with QR code <Slang text="Signatures" />.</span>			
					</p> 

					<p
						style="font-size: 1em; text-align: center; margin: 0;"
					>
						<span>Thus, the <Slang text="Offline Machine" /> doesn't need to send <Slang text="private keys" /> to the <Slang text="Online Machine" />.</span>
					</p>
					
					<div style="height: 0.25cm"></div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>

	<div style="height: 0.25cm"></div>
	
	<Offline_Signing_Example />
</div>
