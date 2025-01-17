




////
//
//
//
import { parse_styles } from '$lib/trinkets/styles/parse'
//
////


export const trends = {
	panel: {
		position: 'relative',
		display: 'inline-flex',
		//'width': '33%', 
		'height': '200px',
		'align-items': 'center',
		'justify-content': 'center',
		'flex-direction': 'column',
		
		'border-radius': '50px'
	},
	anchor: parse_styles ({
		position: 'absolute',
		height: '100%',
		width: '100%',
		
		display: 'flex',
		'align-items': 'center',
		'justify-content': 'center',
		'text-decoration': 'none',
		'text-align': 'center',
		'font-size': '2em',
		
		
	})
}
