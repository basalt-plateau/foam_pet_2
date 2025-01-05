


// @ts-check
import { join } from 'path';

// 1. Import the Skeleton plugin
import { skeleton } from '@skeletonlabs/tw-plugin';

import { PTO_theme } from './_themes/skeleton.theme'
import { Rust_Theme } from './_themes/skeleton.rust.theme'
import { Established_Theme } from './_themes/skeleton.established.theme'
import { Rhubarb_Theme } from './_themes/skeleton.rhubarb.theme'
import { Atolls_Theme } from './_themes/skeleton.atolls.theme'
import { Hacienda_Theme } from './_themes/skeleton.hacienda.theme'
import { Motto_Theme } from './_themes/skeleton.motto.theme'
import { Gauze_Theme } from './_themes/skeleton.Gauze.theme'
import { Domes_Theme } from './_themes/skeleton.Domes.theme'
import { Oceans_Theme } from './_themes/skeleton.Oceans.theme'

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
					Hacienda_Theme,
					Motto_Theme,
					Gauze_Theme,
					Domes_Theme,
					Oceans_Theme
					
					// Rust_Theme, 
					// Established_Theme 
				]
			}
		})
	]
}
						