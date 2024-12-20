




## Prebuilt
const petition_fields = {
	mode: "entry",
							
	address: "0x1",
	module_name: "aptos_account",
	fonction_name: "transfer",

	signer_hexadecimal_address: "991378D74FAC384404B971765BEF7525CCE26C8EFD84B9FF27D202E10D7FFBE5",
	
	type_parameters: [],
	parameters: [
		{
			"name": "address",
			"field": "991378D74FAC384404B971765BEF7525CCE26C8EFD84B9FF27D202E10D7FFBE6"
		},
		{
			"name": "u64",
			"field": "1234"
		}
	]
}

<Petition_Form 
	use_fully_elected_petition_fields="yes"
	fully_elected_petition_fields={ petition_fields }
/>


