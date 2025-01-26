

/*
	[
		{ "name": "address", "field": "" ],
		[ "u64": "" ],
		[ "address": "" ],
		[ "address": "" ]
	]
*/

import _get from 'lodash/get'

export let retrieve_fonction_parameters = ({
	fonction_selected
}) => {
	let proceeds = []
	let parameters = []
	
	if (_get (fonction_selected, "is_entry", "") === true) {
		parameters = fonction_selected.params.slice (1);
	}
	if (_get (fonction_selected, "is_view", "") === true) {
		parameters = fonction_selected.params.slice (0);
	}

	parameters.forEach (parameter => {
		proceeds.push ({
			name: parameter,
			field: ""
		})
	});
	
	return proceeds;
}