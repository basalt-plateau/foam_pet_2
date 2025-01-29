import js from '@eslint/js';
import svelte from 'eslint-plugin-svelte';
import globals from 'globals';

/** @type {import('eslint').Linter.FlatConfig[]} */
export default [
	js.configs.recommended,
	...svelte.configs['flat/recommended'],
	{
		languageOptions: {
			globals: {
				...globals.browser,
				...globals.node
			}
		}
	},
	{
		ignores: ['build/', '.svelte-kit/', 'dist/']
	},
	{
		rules: {
			// 'off', 'warn'
			'no-constant-condition': 'off',
			'no-empty': 'off',
			
			'no-unreachable': 'off',
			'no-unused-vars': 'off' // Set no-unused-vars as a warning
		}
	}
];
