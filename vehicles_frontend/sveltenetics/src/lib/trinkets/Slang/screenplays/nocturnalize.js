





import { has_field } from '$lib/taverns/procedures/object/has_field'

/*
	This splits both " " and "."
*/
const split = ({ text }) => {
	const words = text.split (" ");

	let last = words.length - 1;
	for (let E = 0; E <= last; E++) {
		const is_last = last === E;
		const word_1 = words [E];
		
		/* if the word ends with a . */
		if (word_1.endsWith (".")) {
			words [E] = word_1.substring (0, word_1.length - 1)
			words.splice (E + 1, 0, ".");
			continue;
		}
		else {
			if (!is_last) {
				words.splice (E + 1, 0, " ");
				E = E + 1;
				last = words.length - 1;
			}
		}
	}
	
	return words;
}

const retrieve_search_2 = ({ last, E, words }) => {
	/* if iterator is less than 2 before last, there is a search_2 */
	
	let search_2 = ""
	if (E + 2 <= last) {
		search_2 = words [E] + " " + words [E + 2]
	}
	
	return search_2;
}


/*

 
 

*/
export const nocturnalize = ({
	legend_language,
	text,
	slang = "yes"
}) => {
	var saying = []
	
	const words = split ({ text })
	
	const last = words.length - 1;
	for (let E = 0; E <= last; E++) {
		const is_last = last === E;
		const is_2_before_last = last === E + 1;
		
		const search_1 = words [E];
		let search_2 = retrieve_search_2 ({ last, E, words })

		console.log ({ search_1, search_2 });
		
		if (has_field (legend_language, search_1)) {
			// This checks for 1 word legends
			
			if (slang === "yes") {
				saying.push ({
					original: search_1,
					text: legend_language [ search_1 ],
					code: "yes"
				})
			}
			else {
				saying.push ({
					original: search_1,
					text: search_1,
					code: "yes"
				})
			}
		}
		else if (has_field (legend_language, search_2)) {
			// This checks for 2 word legends
			if (slang === "yes") {
				saying.push ({
					original: search_2,
					text: legend_language [ search_2 ],
					code: "yes"
				})
			}
			else {
				saying.push ({
					original: search_2,
					text: search_2,
					code: "yes"
				})
			}
			
			E = E + 2;
		}
		else {
			saying.push ({
				original: search_2,
				text: search_1
			})
		}
	}
	
	return saying;
}