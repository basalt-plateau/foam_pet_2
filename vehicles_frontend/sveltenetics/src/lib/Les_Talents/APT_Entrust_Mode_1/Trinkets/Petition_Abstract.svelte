





<script>

/*
	import Petition_Flourish from '$lib/Les_Talents/APT_Entrust_Mode_1/Trinkets/Petition_Flourish.svelte'
	<Petition_Flourish 
		AO_parsed={ AO_parsed }
	/>
*/

//
//
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { has_field } from '$lib/taverns/procedures/object/has_field'
//
//

export let AO_parsed = ""
$: {
	
}

const parsed_alert = {}
const make_info_alerts = () => {
	const parsed = AO_parsed;
	
	if (typeof parsed !== "object") {
		return;
	}
	
	if (parsed === null) {
		return;
	}
	
	if (
		has_field (parsed, "amount_as_base_10") !== true &&
		has_field (parsed, "amount_as_base_16")	!== true
	) {
		return;
	}
		
	if (
		parsed.amount_as_base_10.length >= 1 &&
		parsed.amount_as_base_16.length >= 1	
	) {		
		alert_1 = `"${ parsed.amount_as_base_16 }" is equal to "${ parsed.amount_as_base_10 }"`
	}
	
	show_outline = "yes"
	parsed_alert = parsed;
}

</script>




<div 
	style="
		padding: 0.25cm;
	"
	class="card"
>
	<p
		style="
			display: none;
			white-space: pre;
		"
	>{ JSON.stringify (parsed_alert, null, 4) }</p>
	
	<Accordion>
		<AccordionItem open>
			<svelte:fragment slot="summary">
				<header
					style="
						text-align: center;
						font-size: 1.25em;
						padding: 0cm 0;
					"
				>Flourish</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div class="table-container">
					<table class="table table-compact">
						<tbody>
							<tr>
								<td>From</td>
								<td>{ parsed_alert.address_of_sender }</td>
							</tr>
							<tr>
								<td>To</td>
								<td>{ parsed_alert.address_of_recipient }</td>
							</tr>
							<tr>
								<td>Amount</td>
								<td>{ parsed_alert.amount_as_base_10 } Octas</td>
							</tr>
							<tr>
								<td>max gas amount</td>
								<td>{ parsed_alert.max_gas_amount } Octas</td>
							</tr>
							<tr>
								<td>gas unit price</td>
								<td>{ parsed_alert.gas_unit_price } Octas</td>
							</tr>
						</tbody>
					</table>
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>				
</div>