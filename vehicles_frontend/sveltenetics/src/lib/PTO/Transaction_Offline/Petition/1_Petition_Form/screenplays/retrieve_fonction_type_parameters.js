
import _get from 'lodash/get'

export let retrieve_fonction_type_parameters = ({
	fonction_selected
}) => {
	let proceeds = []
	let generic_type_params = fonction_selected.generic_type_params.slice (0);
	
	generic_type_params.forEach (generic_type_param => {
		proceeds.push ({
			name: "",
			field: ""
		})
	});
	
	// console.log ({ generic_type_params });
	
	return proceeds;
	
	
	
	
	
	
	
	
}