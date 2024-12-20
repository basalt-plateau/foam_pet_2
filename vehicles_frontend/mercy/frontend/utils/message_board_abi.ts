export const MESSAGE_BOARD_ABI = {"address":"0x7b8e2193ae3ed507c7c1e79999fbd0f047d47ff7363181b0bb4200fd701ca794","name":"message_board","friends":[],"exposed_functions":[{"name":"exist_message","visibility":"public","is_entry":false,"is_view":true,"generic_type_params":[],"params":[],"return":["bool"]},{"name":"get_message_content","visibility":"public","is_entry":false,"is_view":true,"generic_type_params":[],"params":[],"return":["0x1::string::String"]},{"name":"post_message","visibility":"public","is_entry":true,"is_view":false,"generic_type_params":[],"params":["&signer","0x1::string::String"],"return":[]}],"structs":[{"name":"BoardObjectController","is_native":false,"is_event":false,"abilities":["key"],"generic_type_params":[],"fields":[{"name":"extend_ref","type":"0x1::object::ExtendRef"}]},{"name":"Message","is_native":false,"is_event":false,"abilities":["key"],"generic_type_params":[],"fields":[{"name":"string_content","type":"0x1::string::String"}]}]} as const;