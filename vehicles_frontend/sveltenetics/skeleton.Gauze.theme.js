


export const Gauze_Theme = {
    name: 'Gauze',
    properties: {
		// =~= Theme Properties =~=
		"--theme-font-family-base": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-family-heading": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
		"--theme-font-color-base": "0 0 0",
		"--theme-font-color-dark": "255 255 255",
		"--theme-rounded-base": "9999px",
		"--theme-rounded-container": "24px",
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
		// primary | #f66151 
		"--color-primary-50": "254 231 229", // #fee7e5
		"--color-primary-100": "253 223 220", // #fddfdc
		"--color-primary-200": "253 216 212", // #fdd8d4
		"--color-primary-300": "251 192 185", // #fbc0b9
		"--color-primary-400": "249 144 133", // #f99085
		"--color-primary-500": "246 97 81", // #f66151
		"--color-primary-600": "221 87 73", // #dd5749
		"--color-primary-700": "185 73 61", // #b9493d
		"--color-primary-800": "148 58 49", // #943a31
		"--color-primary-900": "121 48 40", // #793028
		// secondary | #d66868 
		"--color-secondary-50": "249 232 232", // #f9e8e8
		"--color-secondary-100": "247 225 225", // #f7e1e1
		"--color-secondary-200": "245 217 217", // #f5d9d9
		"--color-secondary-300": "239 195 195", // #efc3c3
		"--color-secondary-400": "226 149 149", // #e29595
		"--color-secondary-500": "214 104 104", // #d66868
		"--color-secondary-600": "193 94 94", // #c15e5e
		"--color-secondary-700": "161 78 78", // #a14e4e
		"--color-secondary-800": "128 62 62", // #803e3e
		"--color-secondary-900": "105 51 51", // #693333
		// tertiary | #df7f7f 
		"--color-tertiary-50": "250 236 236", // #faecec
		"--color-tertiary-100": "249 229 229", // #f9e5e5
		"--color-tertiary-200": "247 223 223", // #f7dfdf
		"--color-tertiary-300": "242 204 204", // #f2cccc
		"--color-tertiary-400": "233 165 165", // #e9a5a5
		"--color-tertiary-500": "223 127 127", // #df7f7f
		"--color-tertiary-600": "201 114 114", // #c97272
		"--color-tertiary-700": "167 95 95", // #a75f5f
		"--color-tertiary-800": "134 76 76", // #864c4c
		"--color-tertiary-900": "109 62 62", // #6d3e3e
		// success | #62a0ea 
		"--color-success-50": "231 241 252", // #e7f1fc
		"--color-success-100": "224 236 251", // #e0ecfb
		"--color-success-200": "216 231 250", // #d8e7fa
		"--color-success-300": "192 217 247", // #c0d9f7
		"--color-success-400": "145 189 240", // #91bdf0
		"--color-success-500": "98 160 234", // #62a0ea
		"--color-success-600": "88 144 211", // #5890d3
		"--color-success-700": "74 120 176", // #4a78b0
		"--color-success-800": "59 96 140", // #3b608c
		"--color-success-900": "48 78 115", // #304e73
		// warning | #8ff0a4 
		"--color-warning-50": "238 253 241", // #eefdf1
		"--color-warning-100": "233 252 237", // #e9fced
		"--color-warning-200": "227 251 232", // #e3fbe8
		"--color-warning-300": "210 249 219", // #d2f9db
		"--color-warning-400": "177 245 191", // #b1f5bf
		"--color-warning-500": "143 240 164", // #8ff0a4
		"--color-warning-600": "129 216 148", // #81d894
		"--color-warning-700": "107 180 123", // #6bb47b
		"--color-warning-800": "86 144 98", // #569062
		"--color-warning-900": "70 118 80", // #467650
		// error | #57e389 
		"--color-error-50": "230 251 237", // #e6fbed
		"--color-error-100": "221 249 231", // #ddf9e7
		"--color-error-200": "213 248 226", // #d5f8e2
		"--color-error-300": "188 244 208", // #bcf4d0
		"--color-error-400": "137 235 172", // #89ebac
		"--color-error-500": "87 227 137", // #57e389
		"--color-error-600": "78 204 123", // #4ecc7b
		"--color-error-700": "65 170 103", // #41aa67
		"--color-error-800": "52 136 82", // #348852
		"--color-error-900": "43 111 67", // #2b6f43
		// surface | #cea198 
		"--color-surface-50": "248 241 240", // #f8f1f0
		"--color-surface-100": "245 236 234", // #f5ecea
		"--color-surface-200": "243 232 229", // #f3e8e5
		"--color-surface-300": "235 217 214", // #ebd9d6
		"--color-surface-400": "221 189 183", // #ddbdb7
		"--color-surface-500": "206 161 152", // #cea198
		"--color-surface-600": "185 145 137", // #b99189
		"--color-surface-700": "155 121 114", // #9b7972
		"--color-surface-800": "124 97 91", // #7c615b
		"--color-surface-900": "101 79 74", // #654f4a
		
	}
}



