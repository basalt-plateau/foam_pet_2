


//

import { 
	build_unsigned_tx_from_hexadecimal_string 
} from '$lib/PTO/Transaction/Unsigned/from_hexadecimal_string'


import { 
	parse_bracket 
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Screenplays/transaction_petition/bracket/parse.js'

export const add_unsigned_transaction = async ({
	unsigned_transaction_hexadecimal_string,
	freight
}) => {
	const {
		unsigned_tx,
		unsigned_tx_stringified
	} = build_unsigned_tx_from_hexadecimal_string ({
		unsigned_tx_hexadecimal_string: unsigned_transaction_hexadecimal_string
	})
	
	freight.Unsigned_Transaction_Fields.Aptos_object = unsigned_tx
	freight.Unsigned_Transaction_Fields.Aptos_object_fiberized = unsigned_tx_stringified
	freight.Unsigned_Transaction_Fields.hexadecimal_string = unsigned_transaction_hexadecimal_string
	
	// console.log ({ unsigned_tx })
	
	const parsed_bracket = parse_bracket ({ bracket: unsigned_tx });
	console.log ({ parsed_bracket })
	
	freight.Unsigned_Transaction_Fields.Aptos_object_parsed = parsed_bracket;
	
	/*console.log ({
		address_of_sender,
		address_of_recipient,
		
		amount_as_base_16,
		amount_as_base_10
	})*/
	
	freight.Unsigned_Transaction_Fields.alert_success = "The petition was added."
	freight.Unsigned_Transaction_Fields.info_text = ""	
	freight.Unsigned_Transaction_Fields.added = "yes"
}




//