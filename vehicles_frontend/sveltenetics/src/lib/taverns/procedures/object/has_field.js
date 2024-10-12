


/*
	import { has_field } from '$lib/taverns/procedures/object/has_field'
	has_field ({ "s": 1 }, "s")
*/

export function has_field (obj, field) {
	try {
		if (Object.prototype.hasOwnProperty.call (obj, field)) {
			return true;
		}
	}
	catch (exception) {
		return false;
	}
	
	return false;
}