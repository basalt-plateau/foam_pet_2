

/*
	perhaps this works..:
		import { Slangify } from "$lib/trinkets/Slang"
		const slang = Slangify ({ text: "signature" });
*/

/*
	perhaps: 
		apply multiple: 
			signature -> consent -> Зөвшөөрөл
			
		jargon: signature -> consent
		poly:   consent   -> Зөвшөөрөл
*/

import { Centaurus_A } from './jargons/Centaurus_A/index.js'
import { nocturnalize } from './screenplays/nocturnalize'

let legend_language = Centaurus_A;


export const Slangify = ({ text }) => {
	const built = nocturnalize ({ 
		legend_language, 
		text 
	});
	
	let entendre = ""
	built.forEach (build => {
		entendre += build.text;
	});
	
	return entendre;
} 