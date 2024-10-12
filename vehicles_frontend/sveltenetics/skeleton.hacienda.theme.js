

export var Hacienda_Theme = {
    name: 'Hacienda',
    properties: {
		// =~= Theme Properties =~=
		"--theme-font-family-base": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-family-heading": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-color-base": "0 0 0",
		"--theme-font-color-dark": "255 255 255",
		"--theme-rounded-base": "8px",
		"--theme-rounded-container": "8px",
		"--theme-border-base": "2px",
		// =~= Theme On-X Colors =~=
		"--on-primary": "0 0 0",
		"--on-secondary": "0 0 0",
		"--on-tertiary": "0 0 0",
		"--on-success": "0 0 0",
		"--on-warning": "0 0 0",
		"--on-error": "0 0 0",
		"--on-surface": "255 255 255",
		// =~= Theme Colors  =~=
		// primary | #cdab8f 
		"--color-primary-50": "248 242 238", // #f8f2ee
		"--color-primary-100": "245 238 233", // #f5eee9
		"--color-primary-200": "243 234 227", // #f3eae3
		"--color-primary-300": "235 221 210", // #ebddd2
		"--color-primary-400": "220 196 177", // #dcc4b1
		"--color-primary-500": "205 171 143", // #cdab8f
		"--color-primary-600": "185 154 129", // #b99a81
		"--color-primary-700": "154 128 107", // #9a806b
		"--color-primary-800": "123 103 86", // #7b6756
		"--color-primary-900": "100 84 70", // #645446
		// secondary | #b5835a 
		"--color-secondary-50": "244 236 230", // #f4ece6
		"--color-secondary-100": "240 230 222", // #f0e6de
		"--color-secondary-200": "237 224 214", // #ede0d6
		"--color-secondary-300": "225 205 189", // #e1cdbd
		"--color-secondary-400": "203 168 140", // #cba88c
		"--color-secondary-500": "181 131 90", // #b5835a
		"--color-secondary-600": "163 118 81", // #a37651
		"--color-secondary-700": "136 98 68", // #886244
		"--color-secondary-800": "109 79 54", // #6d4f36
		"--color-secondary-900": "89 64 44", // #59402c
		// tertiary | #986a44 
		"--color-tertiary-50": "240 233 227", // #f0e9e3
		"--color-tertiary-100": "234 225 218", // #eae1da
		"--color-tertiary-200": "229 218 208", // #e5dad0
		"--color-tertiary-300": "214 195 180", // #d6c3b4
		"--color-tertiary-400": "183 151 124", // #b7977c
		"--color-tertiary-500": "152 106 68", // #986a44
		"--color-tertiary-600": "137 95 61", // #895f3d
		"--color-tertiary-700": "114 80 51", // #725033
		"--color-tertiary-800": "91 64 41", // #5b4029
		"--color-tertiary-900": "74 52 33", // #4a3421
		// success | #8ff0a4 
		"--color-success-50": "238 253 241", // #eefdf1
		"--color-success-100": "233 252 237", // #e9fced
		"--color-success-200": "227 251 232", // #e3fbe8
		"--color-success-300": "210 249 219", // #d2f9db
		"--color-success-400": "177 245 191", // #b1f5bf
		"--color-success-500": "143 240 164", // #8ff0a4
		"--color-success-600": "129 216 148", // #81d894
		"--color-success-700": "107 180 123", // #6bb47b
		"--color-success-800": "86 144 98", // #569062
		"--color-success-900": "70 118 80", // #467650
		// warning | #ffa348 
		"--color-warning-50": "255 241 228", // #fff1e4
		"--color-warning-100": "255 237 218", // #ffedda
		"--color-warning-200": "255 232 209", // #ffe8d1
		"--color-warning-300": "255 218 182", // #ffdab6
		"--color-warning-400": "255 191 127", // #ffbf7f
		"--color-warning-500": "255 163 72", // #ffa348
		"--color-warning-600": "230 147 65", // #e69341
		"--color-warning-700": "191 122 54", // #bf7a36
		"--color-warning-800": "153 98 43", // #99622b
		"--color-warning-900": "125 80 35", // #7d5023
		// error | #e01b24 
		"--color-error-50": "250 221 222", // #faddde
		"--color-error-100": "249 209 211", // #f9d1d3
		"--color-error-200": "247 198 200", // #f7c6c8
		"--color-error-300": "243 164 167", // #f3a4a7
		"--color-error-400": "233 95 102", // #e95f66
		"--color-error-500": "224 27 36", // #e01b24
		"--color-error-600": "202 24 32", // #ca1820
		"--color-error-700": "168 20 27", // #a8141b
		"--color-error-800": "134 16 22", // #861016
		"--color-error-900": "110 13 18", // #6e0d12
		// surface | #3d3846 
		"--color-surface-50": "226 225 227", // #e2e1e3
		"--color-surface-100": "216 215 218", // #d8d7da
		"--color-surface-200": "207 205 209", // #cfcdd1
		"--color-surface-300": "177 175 181", // #b1afb5
		"--color-surface-400": "119 116 126", // #77747e
		"--color-surface-500": "61 56 70", // #3d3846
		"--color-surface-600": "55 50 63", // #37323f
		"--color-surface-700": "46 42 53", // #2e2a35
		"--color-surface-800": "37 34 42", // #25222a
		"--color-surface-900": "30 27 34", // #1e1b22
		
	}
}