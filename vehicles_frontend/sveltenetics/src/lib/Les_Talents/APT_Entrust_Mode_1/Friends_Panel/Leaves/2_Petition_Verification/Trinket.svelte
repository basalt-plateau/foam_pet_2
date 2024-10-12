




<script>

//\
//
import { CodeBlock } from '@skeletonlabs/skeleton';
import { clipboard } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
//
import { onMount, onDestroy } from 'svelte';
import CircleAlert from 'lucide-svelte/icons/circle-alert'
//
//
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Info_Alert from '$lib/trinkets/Alerts/Info.svelte'
import Progress_Wall from '$lib/trinkets/Progress/Wall/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import { string_from_Uint8Array } from '$lib/taverns/hexadecimal/string_from_Uint8Array'
//
//
import Petition_Object from './Trinkets/Object.svelte'
//
///

import { 
	pick_expiration 
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Screenplays/transaction_petition/fields/expiration'
import { 
	create_TP_AO_from_fields
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Screenplays/transaction_petition/create/AO_from_fields'


	
import { 
	retrieve_truck, 
	monitor_truck,
	delete_unsigned_transaction
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Friends_Panel/Logistics/Truck'
//
//\
//\\


/*
	https://github.com/aptos-labs/aptos-ts-sdk/blob/01bf8369f4033996fe5bd20b2172fcad574b1108/src/transactions/types.ts#L100
*/
const prepare_options = ({
	freight
}) => {
	const options = {
		expireTimestamp: pick_expiration ({ 
			after_seconds: freight.fields.transaction_expiration  
		})
	}
	if (freight.fields.use_custom_gas_unit_price === "yes") {
		options.gasUnitPrice = BigInt (freight.fields.gas_unit_price);
	}
	if (freight.fields.use_custom_max_gas_amount === "yes") {
		options.maxGasAmount = BigInt (freight.fields.max_gas_amount);
	}
	
	return options;
}



let prepared = "no"
let Truck_Monitor;
let freight;
onMount (async () => {
	const Truck = retrieve_truck ()
	freight = Truck.freight; 
	
	delete_unsigned_transaction ()
	

	//
	//
	//
	//
	freight.current_land = "Petition_Verification"

	Truck_Monitor = monitor_truck ((_freight) => {
		freight = _freight;
	})
	
	prepared = "yes"
	
	try {
		const {
			UTP_AO,
			UTP_hexadecimal_string,
			UTP_stringified,
			
			info_alerts
			
		} = await create_TP_AO_from_fields ({
			net_path: freight.fields.ICANN_net_path,
		
			from_address_hexadecimal_string: freight.fields.from_address_hexadecimal_string,
			to_address_hexadecimal_string: freight.fields.to_address_hexadecimal_string,
			amount: freight.fields.actual_amount_of_Octas,
			
			options: prepare_options ({ freight })
		})
		
		freight.unsigned_transaction.alerts_info = info_alerts;
		freight.unsigned_transaction.Aptos_object = UTP_AO;
		freight.unsigned_transaction.hexadecimal_string = UTP_hexadecimal_string
		freight.unsigned_transaction.Aptos_object_fiberized = UTP_stringified
	}
	catch (exception) {
		console.error (exception)
		freight.unsigned_transaction.exception_text = exception.message;
	}
});

onDestroy (() => {
	Truck_Monitor.stop ()
});


let current_format = 0;


let clone_text = "Clone"
let timeout;
const on_clone = async () => {
	clearTimeout (timeout)
	
	clone_text = "Cloned"
	
	await new Promise (resolve => {
		timeout = setTimeout (() => {
			resolve ()
		}, 1000)
	})
	
	clone_text = "Clone"
}

let selected_option = "object"

</script>


{#if prepared === "yes"}
<div 
	monitor="petition verification"
	unsigned_transaction_leaf
	style="
		position: relative;
	"
>
	<div class="card p-4">
		<header
			style="
				text-align: center;
				font-size: 2em;
			"
		>Petition Verification</header>
	</div>

	<section
		style="
			position: relative;
			overflow: scroll;
			padding: .2cm;
		"
	>
		{#if freight.unsigned_transaction.exception_text.length >= 1 }
		<div style="height: 0.25cm" ></div>
		<aside 
			class="alert variant-filled-error" 
			style="display: flex; flex-direction: row; margin-bottom: 20px; padding: 25px 20px;"
		>
			<div>
				<CircleAlert />
			</div>
			<p style="margin: 0; padding-left: 10px;">{freight.unsigned_transaction.exception_text}</p>
		</aside>
		{/if}

		<div>
			{#if selected_option === "object" }
			<div style="height: 0.25cm" ></div>
			<Petition_Object />
			{/if}
		</div>
	</section>
	
	{#if false }
	<Progress_Wall />
	{/if}
</div>
{/if}