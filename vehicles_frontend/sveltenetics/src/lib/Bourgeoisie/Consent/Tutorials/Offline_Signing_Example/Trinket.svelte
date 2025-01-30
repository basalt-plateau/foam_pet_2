

<script>

/*
	import Offline_Signing_Example from '$lib/trinkets/Hints/Offline_Signing_Example/Trinket.svelte'
*/

////
//
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
//
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
//
////

const form_petition = '/pictures/orbital/form_petition.svg';
const send_petition = '/pictures/orbital/send_petition.svg';
const form_signature = '/pictures/orbital/form_signature.svg';
const send_signature = '/pictures/orbital/send_signature.svg';
const form_note = '/pictures/orbital/form_note.svg';




</script>



<div class="card p-1 variant-soft-surface">
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<div
					style="
						text-align: center;
						font-size: 1.5em;
					"
				>
					<p>Offline Elliptic <Slang text="Signature" /> Example</p>
				</div>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div class="card p-2">
					<div style="height: 0.25cm"></div>

					<div class="card p-2">
						<div
							style="
								text-align: center;
								padding: 0.25cm 0;
							"
						>
							<p>
								<span>A <Slang text="Petition" /> is formed on the <Slang text="Online Machine" />.</span>
							</p>
						</div>

						<div
							style="
								display: flex;
								border-radius: 4px;
								justify-content: center;
							"
						>
							<img src={ form_petition } alt="Petition Formation" />
						</div>
					</div>
					
					<div style="height: 0.25cm"></div>

					<div class="card p-2">
						<div
							style="
								text-align: center;
								padding: 0.25cm 0;
							"
						>
							<p>
								<span>A <Slang text="Petition" /> replica is sent to the <Slang text="Offline Machine" />.</span>
							</p>
						</div>

						<div
							style="
								display: flex;
								border-radius: 4px;
								justify-content: center;
							"
						>
							<img src={ send_petition } alt="send petition" />
						</div>
					</div>

					<div style="height: 0.25cm"></div>

					<div class="card p-2">
						<div
							style="
								text-align: center;
								padding: 0.25cm 0;
							"
						>
							<p>With a <Slang text="private key" /> plus <Slang text="petition" />, <Slang text="a_signature" /> can be formulated.</p>
						</div>

						<div
							style="
								display: flex;
								border-radius: 4px;
								justify-content: center;
							"
						>
							<img src={ form_signature } alt="Signature Formation" />
						</div>
					</div>
					
					<div style="height: 0.25cm"></div>

					<div class="card p-2">
						<div
							style="
								text-align: center;
								padding: 0.25cm 0;
							"
						>
							<p>A <Slang text="signature" /> replica can then be sent to the <Slang text="Online Machine" /></p>
						</div>

						<div
							style="
								display: flex;
								border-radius: 4px;
								justify-content: center;
							"
						>
							<img src={ send_signature } alt="move signature" />
						</div>
					</div>

					<div style="height: 0.25cm"></div>

					<div class="card p-2">
						<div
							style="
								text-align: center;
								padding: 0.25cm 0;
							"
						>
							<p>With the <Slang text="Petition" /> + <Slang text="Signature" />, the <Slang text="Consensus" /> can add a <Slang text="Transaction" /> to the <Slang text="Blockchain" />.</p>
						</div>

						<div
							style="
								display: flex;
								border-radius: 4px;
								justify-content: center;
							"
						>
							<img src={ form_note } alt="form note" />
						</div>
					</div>	
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
</div>

