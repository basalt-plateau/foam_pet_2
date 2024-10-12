

import adapter from "@sveltejs/adapter-static"
import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vitest/config';
import path from 'path'
import UnoCSS from 'unocss/vite';




/*
	entryFileNames: '[name].[hash].js',
	chunkFileNames: '[name].[hash].js',
	assetFileNames: '[name].[hash].[ext]'
*/

export default defineConfig({
	plugins: [
		sveltekit ({
			// paths: { base: '/svelte' }
		}), 
		UnoCSS ()
	],

	server: {
		cors: {
			origin: '*',
			methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
			preflightContinue: false,
			optionsSuccessStatus: 204,
		}
	},


	build: {
		transpile: ['@sveltejs/vite-plugin-svelte'],
		rollupOptions: {
			preserveEntrySignatures: 'strict',
			
			output: {
				entryFileNames: '[name].1.js',
				chunkFileNames: '[name].1.js',
				assetFileNames: '[name].1.[ext]'
			}
			
		},
		sourcemap: true
	},
	
	
	/*
		If problem, might need to install node.js
	*/
	test: {
		//
		//	possibilities:
		//		https://github.com/capricorn86/happy-dom
		//
		environment: 'jsdom',
		include: [
			'src/**/*.{test,spec,vitest}.{js,ts}'
		]
	},
	
	kit: {
		// adapter: adapter ({ pages: "builds" }),
		alias: {
			'$trinkets': path.resolve ('./src/trinkets')
		}
	}
});
