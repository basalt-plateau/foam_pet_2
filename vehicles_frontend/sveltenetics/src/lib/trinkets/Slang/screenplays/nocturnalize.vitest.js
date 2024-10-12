



// "src/lib/trinkets/Slang/screenplays/nocturnalize.vitest.js"

import assert from 'assert'
import { describe, it, expect } from 'vitest';
import is_equal from 'lodash/isEqual'


import { nocturnalize } from './nocturnalize'

const language = "English"
const legend = {
	"Francais": {
		
	},
	"English": {
		"consensus": "Group",
		"Consensus": "Group",
		
		"blockchain": "Map",
		"Blockchain": "Map",
		
		"signature": "Signature",
		"Signature": "Signature",		
		
		"transaction": "Story",
		"Transaction": "Story",
		
		"private key": "private key",
		"Private Key": "Private Key",
		
		"public key": "public key",
		"Public Key": "Public Key"	,
		
		"Machine": "Beacon",
		"Online Machine": "Howl Beacon",
		"Offline Machine": "Keys Beacon"
	}
}

let legend_language = legend [ language ]


describe ('nocturnalize', () => {
	it ('nocturnalizes, one word legend', () => {
		const text = "This is a consensus."
		
		const built = nocturnalize ({ legend_language, text });
		const expected = [
			{ original: 'This is', text: 'This' },
			{ original: '   ', text: ' ' },
			{ original: 'is a', text: 'is' },
			{ original: '   ', text: ' ' },
			{ original: 'a consensus', text: 'a' },
			{ original: '  .', text: ' ' },
			{ original: 'consensus', text: 'Group', code: 'yes' },
			{ original: '', text: '.' }
		]
		
		console.log ({ built, expected })
		
		assert (is_equal (built, expected), true)
	});
	
	it ('nocturnalizes, two word legend', () => {
		const text = "This is a Online Machine field."
		
		const built = nocturnalize ({ legend_language, text });
		const expected = [
			{ original: 'This is', text: 'This' },
			{ original: '   ', text: ' ' },
			{ original: 'is a', text: 'is' },
			{ original: '   ', text: ' ' },
			{ original: 'a Online', text: 'a' },
			{ original: '   ', text: ' ' },
			{ original: 'Online Machine', text: 'Howl Beacon', code: 'yes' },
			{ original: '  .', text: ' ' },
			{ original: '', text: 'field' },
			{ original: '', text: '.' }			
		]
		
		console.log ({ built, expected })
		
		assert (is_equal (built, expected), true)
	});
});
