


// @ts-check
import { join } from 'path';

// 1. Import the Skeleton plugin
import { skeleton } from '@skeletonlabs/tw-plugin';

import { PTO_theme } from './skeleton.theme'
import { Rust_Theme } from './skeleton.rust.theme'
import { Established_Theme } from './skeleton.established.theme'
import { Rhubarb_Theme } from './skeleton.rhubarb.theme'
import { Atolls_Theme } from './skeleton.atolls.theme'
import { Hacienda_Theme } from './skeleton.hacienda.theme'

/** @type {import('tailwindcss').Config} */
export default {
	// 2. Opt for dark mode to be handled via the class method
	darkMode: 'class',
	// darkMode: 'selector',
	
	content: [
		'./src/**/*.{html,js,svelte,ts}',
		// 3. Append the path to the Skeleton package
		join(require.resolve(
			'@skeletonlabs/skeleton'),
			'../**/*.{html,js,svelte,ts}'
		)
	],
	theme: {
		extend: {},
	},
	plugins: [
		// 4. Append the Skeleton plugin (after other plugins)
		skeleton({
			themes: { preset: [ "wintry" ] }
		}),
		
		// Then need to change "app.html" data-theme="establed"
		skeleton({
			themes: {
				custom: [ 
					Atolls_Theme,
					Rhubarb_Theme, 
					PTO_theme, 
					Hacienda_Theme
					
					// Rust_Theme, 
					// Established_Theme 
				]
			}
		})
	]
}
						