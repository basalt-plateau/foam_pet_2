

export const Lentils_Theme = {
    name: 'Lentils',
    properties: {
		// =~= Theme Properties =~=
		"--theme-font-family-base": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-family-heading": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-color-base": "0 0 0",
		"--theme-font-color-dark": "255 255 255",
		"--theme-rounded-base": "16px",
		"--theme-rounded-container": "16px",
		"--theme-border-base": "6px",
		// =~= Theme On-X Colors =~=
		"--on-primary": "0 0 0",
		"--on-secondary": "0 0 0",
		"--on-tertiary": "0 0 0",
		"--on-success": "255 255 255",
		"--on-warning": "0 0 0",
		"--on-error": "0 0 0",
		"--on-surface": "0 0 0",
		// =~= Theme Colors  =~=
		// primary | #8ff0a4 
		"--color-primary-50": "238 253 241", // #eefdf1
		"--color-primary-100": "233 252 237", // #e9fced
		"--color-primary-200": "227 251 232", // #e3fbe8
		"--color-primary-300": "210 249 219", // #d2f9db
		"--color-primary-400": "177 245 191", // #b1f5bf
		"--color-primary-500": "143 240 164", // #8ff0a4
		"--color-primary-600": "129 216 148", // #81d894
		"--color-primary-700": "107 180 123", // #6bb47b
		"--color-primary-800": "86 144 98", // #569062
		"--color-primary-900": "70 118 80", // #467650
		// secondary | #33d17a 
		"--color-secondary-50": "224 248 235", // #e0f8eb
		"--color-secondary-100": "214 246 228", // #d6f6e4
		"--color-secondary-200": "204 244 222", // #ccf4de
		"--color-secondary-300": "173 237 202", // #adedca
		"--color-secondary-400": "112 223 162", // #70dfa2
		"--color-secondary-500": "51 209 122", // #33d17a
		"--color-secondary-600": "46 188 110", // #2ebc6e
		"--color-secondary-700": "38 157 92", // #269d5c
		"--color-secondary-800": "31 125 73", // #1f7d49
		"--color-secondary-900": "25 102 60", // #19663c
		// tertiary | #33d17a 
		"--color-tertiary-50": "224 248 235", // #e0f8eb
		"--color-tertiary-100": "214 246 228", // #d6f6e4
		"--color-tertiary-200": "204 244 222", // #ccf4de
		"--color-tertiary-300": "173 237 202", // #adedca
		"--color-tertiary-400": "112 223 162", // #70dfa2
		"--color-tertiary-500": "51 209 122", // #33d17a
		"--color-tertiary-600": "46 188 110", // #2ebc6e
		"--color-tertiary-700": "38 157 92", // #269d5c
		"--color-tertiary-800": "31 125 73", // #1f7d49
		"--color-tertiary-900": "25 102 60", // #19663c
		// success | #272a83 
		"--color-success-50": "223 223 236", // #dfdfec
		"--color-success-100": "212 212 230", // #d4d4e6
		"--color-success-200": "201 202 224", // #c9cae0
		"--color-success-300": "169 170 205", // #a9aacd
		"--color-success-400": "104 106 168", // #686aa8
		"--color-success-500": "39 42 131", // #272a83
		"--color-success-600": "35 38 118", // #232676
		"--color-success-700": "29 32 98", // #1d2062
		"--color-success-800": "23 25 79", // #17194f
		"--color-success-900": "19 21 64", // #131540
		// warning | #ff7800 
		"--color-warning-50": "255 235 217", // #ffebd9
		"--color-warning-100": "255 228 204", // #ffe4cc
		"--color-warning-200": "255 221 191", // #ffddbf
		"--color-warning-300": "255 201 153", // #ffc999
		"--color-warning-400": "255 161 77", // #ffa14d
		"--color-warning-500": "255 120 0", // #ff7800
		"--color-warning-600": "230 108 0", // #e66c00
		"--color-warning-700": "191 90 0", // #bf5a00
		"--color-warning-800": "153 72 0", // #994800
		"--color-warning-900": "125 59 0", // #7d3b00
		// error | #ff7800 
		"--color-error-50": "255 235 217", // #ffebd9
		"--color-error-100": "255 228 204", // #ffe4cc
		"--color-error-200": "255 221 191", // #ffddbf
		"--color-error-300": "255 201 153", // #ffc999
		"--color-error-400": "255 161 77", // #ffa14d
		"--color-error-500": "255 120 0", // #ff7800
		"--color-error-600": "230 108 0", // #e66c00
		"--color-error-700": "191 90 0", // #bf5a00
		"--color-error-800": "153 72 0", // #994800
		"--color-error-900": "125 59 0", // #7d3b00
		// surface | #3584e4 
		"--color-surface-50": "225 237 251", // #e1edfb
		"--color-surface-100": "215 230 250", // #d7e6fa
		"--color-surface-200": "205 224 248", // #cde0f8
		"--color-surface-300": "174 206 244", // #aecef4
		"--color-surface-400": "114 169 236", // #72a9ec
		"--color-surface-500": "53 132 228", // #3584e4
		"--color-surface-600": "48 119 205", // #3077cd
		"--color-surface-700": "40 99 171", // #2863ab
		"--color-surface-800": "32 79 137", // #204f89
		"--color-surface-900": "26 65 112", // #1a4170
		
	}
}