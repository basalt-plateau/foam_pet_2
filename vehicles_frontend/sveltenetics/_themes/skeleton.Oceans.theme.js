

export const Oceans_Theme = {
    name: 'Oceans',
    properties: {
		// =~= Theme Properties =~=
		"--theme-font-family-base": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-family-heading": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-color-base": "var(--color-surface-900)",
		"--theme-font-color-dark": "var(--color-surface-50)",
		"--theme-rounded-base": "8px",
		"--theme-rounded-container": "8px",
		"--theme-border-base": "4px",
		// =~= Theme On-X Colors =~=
		"--on-primary": "var(--color-success-600)",
		"--on-secondary": "var(--color-success-600)",
		"--on-tertiary": "var(--color-success-600)",
		"--on-success": "var(--color-primary-400)",
		"--on-warning": "0 0 0",
		"--on-error": "0 0 0",
		"--on-surface": "255 255 255",
		// =~= Theme Colors  =~=
		// primary | #99c1f1 
		"--color-primary-50": "240 246 253", // #f0f6fd
		"--color-primary-100": "235 243 252", // #ebf3fc
		"--color-primary-200": "230 240 252", // #e6f0fc
		"--color-primary-300": "214 230 249", // #d6e6f9
		"--color-primary-400": "184 212 245", // #b8d4f5
		"--color-primary-500": "153 193 241", // #99c1f1
		"--color-primary-600": "138 174 217", // #8aaed9
		"--color-primary-700": "115 145 181", // #7391b5
		"--color-primary-800": "92 116 145", // #5c7491
		"--color-primary-900": "75 95 118", // #4b5f76
		// secondary | #62a0ea 
		"--color-secondary-50": "231 241 252", // #e7f1fc
		"--color-secondary-100": "224 236 251", // #e0ecfb
		"--color-secondary-200": "216 231 250", // #d8e7fa
		"--color-secondary-300": "192 217 247", // #c0d9f7
		"--color-secondary-400": "145 189 240", // #91bdf0
		"--color-secondary-500": "98 160 234", // #62a0ea
		"--color-secondary-600": "88 144 211", // #5890d3
		"--color-secondary-700": "74 120 176", // #4a78b0
		"--color-secondary-800": "59 96 140", // #3b608c
		"--color-secondary-900": "48 78 115", // #304e73
		// tertiary | #3584e4 
		"--color-tertiary-50": "225 237 251", // #e1edfb
		"--color-tertiary-100": "215 230 250", // #d7e6fa
		"--color-tertiary-200": "205 224 248", // #cde0f8
		"--color-tertiary-300": "174 206 244", // #aecef4
		"--color-tertiary-400": "114 169 236", // #72a9ec
		"--color-tertiary-500": "53 132 228", // #3584e4
		"--color-tertiary-600": "48 119 205", // #3077cd
		"--color-tertiary-700": "40 99 171", // #2863ab
		"--color-tertiary-800": "32 79 137", // #204f89
		"--color-tertiary-900": "26 65 112", // #1a4170
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
		// error | #ffbe6f 
		"--color-error-50": "255 245 233", // #fff5e9
		"--color-error-100": "255 242 226", // #fff2e2
		"--color-error-200": "255 239 219", // #ffefdb
		"--color-error-300": "255 229 197", // #ffe5c5
		"--color-error-400": "255 210 154", // #ffd29a
		"--color-error-500": "255 190 111", // #ffbe6f
		"--color-error-600": "230 171 100", // #e6ab64
		"--color-error-700": "191 143 83", // #bf8f53
		"--color-error-800": "153 114 67", // #997243
		"--color-error-900": "125 93 54", // #7d5d36
		// surface | #613583 
		"--color-surface-50": "231 225 236", // #e7e1ec
		"--color-surface-100": "223 215 230", // #dfd7e6
		"--color-surface-200": "216 205 224", // #d8cde0
		"--color-surface-300": "192 174 205", // #c0aecd
		"--color-surface-400": "144 114 168", // #9072a8
		"--color-surface-500": "97 53 131", // #613583
		"--color-surface-600": "87 48 118", // #573076
		"--color-surface-700": "73 40 98", // #492862
		"--color-surface-800": "58 32 79", // #3a204f
		"--color-surface-900": "48 26 64", // #301a40
		
	}
}