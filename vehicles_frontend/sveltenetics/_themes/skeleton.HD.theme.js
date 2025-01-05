

export const HD_Theme = {
    name: 'HD 40307g',
    properties: {
		// =~= Theme Properties =~=
		"--theme-font-family-base": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-family-heading": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-color-base": "0 0 0",
		"--theme-font-color-dark": "255 255 255",
		"--theme-rounded-base": "6px",
		"--theme-rounded-container": "6px",
		"--theme-border-base": "2px",
		// =~= Theme On-X Colors =~=
		"--on-primary": "255 255 255",
		"--on-secondary": "255 255 255",
		"--on-tertiary": "255 255 255",
		"--on-success": "255 255 255",
		"--on-warning": "255 255 255",
		"--on-error": "255 255 255",
		"--on-surface": "255 255 255",
		// =~= Theme Colors  =~=
		// primary | #3d3846 
		"--color-primary-50": "226 225 227", // #e2e1e3
		"--color-primary-100": "216 215 218", // #d8d7da
		"--color-primary-200": "207 205 209", // #cfcdd1
		"--color-primary-300": "177 175 181", // #b1afb5
		"--color-primary-400": "119 116 126", // #77747e
		"--color-primary-500": "61 56 70", // #3d3846
		"--color-primary-600": "55 50 63", // #37323f
		"--color-primary-700": "46 42 53", // #2e2a35
		"--color-primary-800": "37 34 42", // #25222a
		"--color-primary-900": "30 27 34", // #1e1b22
		// secondary | #174458 
		"--color-secondary-50": "220 227 230", // #dce3e6
		"--color-secondary-100": "209 218 222", // #d1dade
		"--color-secondary-200": "197 208 213", // #c5d0d5
		"--color-secondary-300": "162 180 188", // #a2b4bc
		"--color-secondary-400": "93 124 138", // #5d7c8a
		"--color-secondary-500": "23 68 88", // #174458
		"--color-secondary-600": "21 61 79", // #153d4f
		"--color-secondary-700": "17 51 66", // #113342
		"--color-secondary-800": "14 41 53", // #0e2935
		"--color-secondary-900": "11 33 43", // #0b212b
		// tertiary | #264f72 
		"--color-tertiary-50": "222 229 234", // #dee5ea
		"--color-tertiary-100": "212 220 227", // #d4dce3
		"--color-tertiary-200": "201 211 220", // #c9d3dc
		"--color-tertiary-300": "168 185 199", // #a8b9c7
		"--color-tertiary-400": "103 132 156", // #67849c
		"--color-tertiary-500": "38 79 114", // #264f72
		"--color-tertiary-600": "34 71 103", // #224767
		"--color-tertiary-700": "29 59 86", // #1d3b56
		"--color-tertiary-800": "23 47 68", // #172f44
		"--color-tertiary-900": "19 39 56", // #132738
		// success | #000000 
		"--color-success-50": "217 217 217", // #d9d9d9
		"--color-success-100": "204 204 204", // #cccccc
		"--color-success-200": "191 191 191", // #bfbfbf
		"--color-success-300": "153 153 153", // #999999
		"--color-success-400": "77 77 77", // #4d4d4d
		"--color-success-500": "0 0 0", // #000000
		"--color-success-600": "0 0 0", // #000000
		"--color-success-700": "0 0 0", // #000000
		"--color-success-800": "0 0 0", // #000000
		"--color-success-900": "0 0 0", // #000000
		// warning | #c01c28 
		"--color-warning-50": "246 221 223", // #f6dddf
		"--color-warning-100": "242 210 212", // #f2d2d4
		"--color-warning-200": "239 198 201", // #efc6c9
		"--color-warning-300": "230 164 169", // #e6a4a9
		"--color-warning-400": "211 96 105", // #d36069
		"--color-warning-500": "192 28 40", // #c01c28
		"--color-warning-600": "173 25 36", // #ad1924
		"--color-warning-700": "144 21 30", // #90151e
		"--color-warning-800": "115 17 24", // #731118
		"--color-warning-900": "94 14 20", // #5e0e14
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
		// surface | #381c5f 
		"--color-surface-50": "225 221 231", // #e1dde7
		"--color-surface-100": "215 210 223", // #d7d2df
		"--color-surface-200": "205 198 215", // #cdc6d7
		"--color-surface-300": "175 164 191", // #afa4bf
		"--color-surface-400": "116 96 143", // #74608f
		"--color-surface-500": "56 28 95", // #381c5f
		"--color-surface-600": "50 25 86", // #321956
		"--color-surface-700": "42 21 71", // #2a1547
		"--color-surface-800": "34 17 57", // #221139
		"--color-surface-900": "27 14 47", // #1b0e2f
		
	}
}