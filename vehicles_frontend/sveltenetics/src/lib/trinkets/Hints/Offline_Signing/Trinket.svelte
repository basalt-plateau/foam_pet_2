
<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'

const form_petition = '/pictures/orbital/form_petition.svg';
const send_petition = '/pictures/orbital/send_petition.svg';
const form_signature = '/pictures/orbital/form_signature.svg';
const send_signature = '/pictures/orbital/send_signature.svg';
const form_note = '/pictures/orbital/form_note.svg';

import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';


</script>


<div class="card p-4">
	<div style="height: 1cm"></div>
	
	<header
		style="font-size: 2.5em; text-align: center"
	><Slang text="Signatures" /></header>

	<div style="height: 1cm"></div>
	<hr class="!border-t-2" />
	<div style="height: 1cm"></div>
	
	<p
		style="font-size: 1em; text-align: center"
	>
		<span><Slang text="Signatures" /> show that <Slang text="an_Account" /> endorses a <Slang text="Petition" />.</span>			
	</p> 

	<div style="height: 1cm"></div>
	<hr class="!border-t-2" />
	<div style="height: 1cm"></div>

	<p
		style="font-size: 1em; text-align: center"
	>
		<span>An <Slang text="Offline Machine" /> can communicate with an <Slang text="Online Machine" /> with QR code <Slang text="Signatures" />.</span>			
	</p> 

	<div style="height: 0.5cm"></div>
	
	<p
		style="font-size: 1em; text-align: center"
	>
		<span>Thus, <Slang text="Private Keys" /> nevers needs to be sent to an <Slang text="Online Machine" />.</span>
	</p>
	
	<div style="height: 1cm"></div>
	<hr class="!border-t-2" />
	<div style="height: 1cm"></div>
	
	<div class="card p-2 variant-filled-primary">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div
						style="
							text-align: center;
							font-size: 1.5em;
						"
					>
						<p>Offline Signing Example</p>
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div>
						<div style="height: 0.25cm"></div>

						<p style="font-size: 1em; text-align: center; display: none;">
							<span class="badge variant-filled-primary">@ Orbital Alignment</span>
						</p>

						<div class="card p-2">
							<div
								style="
									text-align: center;
									padding: 0.25cm 0;
								"
							>
								<p>
									The <Slang text="Online Machine" /> and the <Slang text="Offline Machine" /> both need <Slang text="Pet" />.
								</p>
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
								<header style="font-size: 1.5em"><Slang text="Petition" /> Formation</header>
								<p>
									<span>A <Slang text="Petition" /> can be formed from the <Slang text="Online Machine" /> at</span>
									<Milieus_Button
										style="display: inline-block;"
										name={ "Talents" }
										location={[ "Friends", "Talents" ]}
										is_open_location={[ "Friends" ]}
									/>
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
								<header style="font-size: 1.5em"><Slang text="Petition" /> Distribution</header>
								<p>
									<span>A <Slang text="Petition" /> replica can then be sent to the <Slang text="Offline Machine" /> at</span>
									<Milieus_Button
										style="display: inline-block;"
										name={ "Signatures" }
										location={[ "Loyals", "Signatures" ]}
										is_open_location={[ "Loyals" ]}
									/>
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
								<header style="font-size: 1.5em"><Slang text="Signature" /> Formation</header>
								<p>With a <Slang text="Petition" /> + <Slang text="Private Key" />, a <Slang text="Signature" /> can be formed.</p>
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
								<header style="font-size: 1.5em"><Slang text="Signature" /> Distribution</header>
								<p>A <Slang text="Signature" /> replica can then be sent to the <Slang text="Online Machine" /></p>
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
								<header style="font-size: 1.5em"><Slang text="Transaction" /> Formation</header>
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
</div>
