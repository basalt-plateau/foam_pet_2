

<script>

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import { parse_styles } from '$lib/trinkets/styles/parse.js';
import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'

let possible_waves = parse_with_commas (
	"115792089237316195423570985008687907853269984665640564039457584007913129639936",
	{
		"with_line_breaks": "yes"
	}
)

</script>


<div class="card p-1 variant-soft-surface">
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<header
					style="{parse_styles ({
						'display': 'block',
						'text-align': 'center',
						'font-size': '1.5em',
						'line-height': '1.5em',
					})}"
				>
					<span>EEC 25519 Mathematics</span>
				</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div>
					<header
						style="{parse_styles ({
							'display': 'block',
							'text-align': 'center',
							'font-size': '1.5em',
							'line-height': '1em',
						})}"
					>
						<span>Edward's Elliptic Curve (EEC) 25519 <Slang text="Private Keys" /></span>
					</header>
					
					<div style="height: 0.4cm"></div>
					
					<p>
						An EEC 25519 <Slang text="Private Key" /> is 64 hexadecimal (base 16) characters.
					</p>
					<p>
						The possible hexadecimal characters are 0123456789ABCDEF.
					</p>
					
					<div style="height: 0.4cm"></div>
					
					<span style="word-break: break-word">For each <Slang text="Private Key" /> there is a unique <Slang text="Public Key" />.</span>
					
					<div style="height: 0.4cm"></div>
					
					<span style="word-break: break-word">There are 64^16 possible <Slang text="Private Keys" /> and thus 64^16 possible <Slang text="Public Keys" />.</span>
					<br/>
					<p>
						<span style="display: inline-block">As base 10 that equals</span>
						<span 
							class="badge variant-filled"
							style="display: inline-block"
						>&gt;1.157 E +77</span>
						<span style="display: inline-block">possible key pairs:</span>
					</p>
					
					<span
						style="
							white-space: pre-wrap;
							max-width: 300px;
							margin: 0.1cm auto;
							text-align: right;
						"
					>{ possible_waves.trim () }</span>
					
					<div style="height: 0.4cm"></div>
					
					<p>
						<span style="display: inline-block"></span>
					</p>
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
</div>