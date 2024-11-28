

<script>

import Field from '$lib/trinkets/Field/Trinket.svelte'


////
//
//	Seconds Until Expiration
//
//
let seconds_until_expiration_field = ""
const seconds_until_expiration_on_change = ({ packet }) => {
	const actual_packet_type = typeof packet;
	
	try {
		assert_is_natural_numeral_string (packet)
	}
	catch (exception) {
		return {
			"problem": exception.message
		}
	}
	
	freight.fields.seconds_until_expiration = packet;
	
	return {}
}
const seconds_until_expiration_on_prepare = () => {
	seconds_until_expiration_field.modify_packet ("600")
}
//
////

////
//
//	Max Gas Amount
//
//
let max_gas_amount_field = ""
const max_gas_amount_on_change = ({ packet }) => {
	const actual_packet_type = typeof packet;
	
	try {
		assert_is_natural_numeral_string (packet)
	}
	catch (exception) {
		return {
			"problem": exception.message
		}
	}
	
	freight.fields.max_gas_amount = packet
	
	return {}
}
const max_gas_amount_on_prepare = () => {
	max_gas_amount_field.modify_packet ("200000")
}
//
////


////
//
//	Gas Unit Price
//
//
let gas_unit_price_field = ""
const gas_unit_price_on_change = ({ packet }) => {
	const actual_packet_type = typeof packet;
	
	try {
		assert_is_natural_numeral_string (packet)
	}
	catch (exception) {
		return {
			"problem": exception.message
		}
	}
	
	freight.fields.gas_unit_price = packet;
	
	return {}
}
const gas_unit_price_on_prepare = () => {
	gas_unit_price_field.modify_packet ("100")
}
//
////


</script>


<div>
	<Field 
		monitor="seconds until expiration"
		logo="Seconds Until Expiration"
		
		bind:this={ seconds_until_expiration_field }
		on_change={ seconds_until_expiration_on_change }
		on_prepare={ seconds_until_expiration_on_prepare }
	>
		<div 
			style="
				margin: 0.1cm 0;
			"
			class="card p-1 variant-soft-primary"
		>
			<p
				style="
					text-align: center;
				"
			>After the duration has elapsed, the <Slang text="consensus" /> won't approve the <Slang text="petition" />.</p>
		</div>
	</Field>

	<div style="height: 0.2cm"></div>
	
	<Field 
		monitor="gas unit price"
		logo="Gas Unit Price, in Octas"
		
		
		bind:this={ gas_unit_price_field }
		on_change={ gas_unit_price_on_change }
		on_prepare={ gas_unit_price_on_prepare }
	>
		<div 
			style="
				margin: 0.1cm 0;
			"
			class="card p-1 variant-soft-primary"
		>
			<p
				style="
					text-align: center;
				"
			>	
				<span>Details can be found at:</span>
				<a
					class="anchor"
					target="_blank"
					href={ gas_unit_price_link }
				>{ gas_unit_price_link }</a>
			</p>
		</div>
	</Field>
	
	
	<div style="height: 0.2cm"></div>
	
	<Field 
		monitor="max gas amount"
		logo="Max Gas Amount, in Octas"
		
		bind:this={ max_gas_amount_field }
		on_change={ max_gas_amount_on_change }
		on_prepare={ max_gas_amount_on_prepare }
	>
		<div 
			style="
				margin: 0.1cm 0;
			"
			class="card p-1 variant-soft-primary"
		>
			<p
				style="
					text-align: center;
				"
			>	
				<span>Details can be found at:</span>
				<a
					class="anchor"
					target="_blank"
					href={ maximum_gas_amount_link }
				>{ maximum_gas_amount_link }</a>
			</p>
		</div>
	</Field>
</div>