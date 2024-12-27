
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
						<p>Algorithms</p>
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div 
						style="
							text-align: center;
						"
						class="card p-4"
					>
						<div style="height: 1cm"></div>

						<p><Slang text="petition" /> + <Slang text="sender" /> <Slang text="private key" /> -> <Slang text="sender" /> <Slang text="signature" /> </p>
						
						<div style="height: 0.5cm"></div>
						
						<p><Slang text="petition" /> + <Slang text="sender" /> <Slang text="signature" /> + <Slang text="signature" /> from each <Slang text="validator" /> -> <Slang text="blockchain transaction" /></p>
					
						<div style="height: 1cm"></div>		
					</div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>

	<div style="height: 0.25cm"></div>

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
						<p>QR Codes + Cameras</p>
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div style="height: 0.5cm"></div>

					<p
						style="
							font-size: 1em; 
							text-align: center; 
							margin: 0;
						"
					>
						<span>An <Slang text="Offline Machine" /> can communicate with an <Slang text="Online Machine" /> with <Slang text="a_signature" /> encoded as a QR code.</span>			
					</p> 

					<p
						style="
							font-size: 1em; 
							text-align: center; 
							margin: 0;
						"
					>
						<span>Thus, the <Slang text="Offline Machine" /> doesn't need to send <Slang text="private keys" /> to the <Slang text="Online Machine" />.</span>
					</p>
					
					<div style="height: 0.5cm"></div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>

	<div style="height: 0.25cm"></div>
	
	<Offline_Signing_Example />
</div>
