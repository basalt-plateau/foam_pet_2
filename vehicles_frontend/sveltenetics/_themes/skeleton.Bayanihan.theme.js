


export const Bayanihan_Theme = {
    name: 'Bayanihan',

    properties: {
		// =~= Theme Properties =~=
		"--theme-font-family-base": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-family-heading": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-color-base": "0 0 0",
		"--theme-font-color-dark": "255 255 255",
		"--theme-rounded-base": "16px",
		"--theme-rounded-container": "16px",
		"--theme-border-base": "4px",
		// =~= Theme On-X Colors =~=
		"--on-primary": "0 0 0",
		"--on-secondary": "0 0 0",
		"--on-tertiary": "0 0 0",
		"--on-success": "0 0 0",
		"--on-warning": "0 0 0",
		"--on-error": "0 0 0",
		"--on-surface": "0 0 0",
		// =~= Theme Colors  =~=
		// primary | #ffbe6f 
		"--color-primary-50": "255 245 233", // #fff5e9
		"--color-primary-100": "255 242 226", // #fff2e2
		"--color-primary-200": "255 239 219", // #ffefdb
		"--color-primary-300": "255 229 197", // #ffe5c5
		"--color-primary-400": "255 210 154", // #ffd29a
		"--color-primary-500": "255 190 111", // #ffbe6f
		"--color-primary-600": "230 171 100", // #e6ab64
		"--color-primary-700": "191 143 83", // #bf8f53
		"--color-primary-800": "153 114 67", // #997243
		"--color-primary-900": "125 93 54", // #7d5d36
		// secondary | #e4b679 
		"--color-secondary-50": "251 244 235", // #fbf4eb
		"--color-secondary-100": "250 240 228", // #faf0e4
		"--color-secondary-200": "248 237 222", // #f8edde
		"--color-secondary-300": "244 226 201", // #f4e2c9
		"--color-secondary-400": "236 204 161", // #eccca1
		"--color-secondary-500": "228 182 121", // #e4b679
		"--color-secondary-600": "205 164 109", // #cda46d
		"--color-secondary-700": "171 137 91", // #ab895b
		"--color-secondary-800": "137 109 73", // #896d49
		"--color-secondary-900": "112 89 59", // #70593b
		// tertiary | #ffa348 
		"--color-tertiary-50": "255 241 228", // #fff1e4
		"--color-tertiary-100": "255 237 218", // #ffedda
		"--color-tertiary-200": "255 232 209", // #ffe8d1
		"--color-tertiary-300": "255 218 182", // #ffdab6
		"--color-tertiary-400": "255 191 127", // #ffbf7f
		"--color-tertiary-500": "255 163 72", // #ffa348
		"--color-tertiary-600": "230 147 65", // #e69341
		"--color-tertiary-700": "191 122 54", // #bf7a36
		"--color-tertiary-800": "153 98 43", // #99622b
		"--color-tertiary-900": "125 80 35", // #7d5023
		// success | #f9f06b 
		"--color-success-50": "254 253 233", // #fefde9
		"--color-success-100": "254 252 225", // #fefce1
		"--color-success-200": "254 251 218", // #fefbda
		"--color-success-300": "253 249 196", // #fdf9c4
		"--color-success-400": "251 245 151", // #fbf597
		"--color-success-500": "249 240 107", // #f9f06b
		"--color-success-600": "224 216 96", // #e0d860
		"--color-success-700": "187 180 80", // #bbb450
		"--color-success-800": "149 144 64", // #959040
		"--color-success-900": "122 118 52", // #7a7634
		// warning | #62a0ea 
		"--color-warning-50": "231 241 252", // #e7f1fc
		"--color-warning-100": "224 236 251", // #e0ecfb
		"--color-warning-200": "216 231 250", // #d8e7fa
		"--color-warning-300": "192 217 247", // #c0d9f7
		"--color-warning-400": "145 189 240", // #91bdf0
		"--color-warning-500": "98 160 234", // #62a0ea
		"--color-warning-600": "88 144 211", // #5890d3
		"--color-warning-700": "74 120 176", // #4a78b0
		"--color-warning-800": "59 96 140", // #3b608c
		"--color-warning-900": "48 78 115", // #304e73
		// error | #99c1f1 
		"--color-error-50": "240 246 253", // #f0f6fd
		"--color-error-100": "235 243 252", // #ebf3fc
		"--color-error-200": "230 240 252", // #e6f0fc
		"--color-error-300": "214 230 249", // #d6e6f9
		"--color-error-400": "184 212 245", // #b8d4f5
		"--color-error-500": "153 193 241", // #99c1f1
		"--color-error-600": "138 174 217", // #8aaed9
		"--color-error-700": "115 145 181", // #7391b5
		"--color-error-800": "92 116 145", // #5c7491
		"--color-error-900": "75 95 118", // #4b5f76
		// surface | #ffa348 
		"--color-surface-50": "255 241 228", // #fff1e4
		"--color-surface-100": "255 237 218", // #ffedda
		"--color-surface-200": "255 232 209", // #ffe8d1
		"--color-surface-300": "255 218 182", // #ffdab6
		"--color-surface-400": "255 191 127", // #ffbf7f
		"--color-surface-500": "255 163 72", // #ffa348
		"--color-surface-600": "230 147 65", // #e69341
		"--color-surface-700": "191 122 54", // #bf7a36
		"--color-surface-800": "153 98 43", // #99622b
		"--color-surface-900": "125 80 35", // #7d5023
		
	}
}