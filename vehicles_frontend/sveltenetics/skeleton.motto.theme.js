

export const Motto_Theme = {
    name: 'Motto',
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
		// primary | #f9f06b 
		"--color-primary-50": "254 253 233", // #fefde9
		"--color-primary-100": "254 252 225", // #fefce1
		"--color-primary-200": "254 251 218", // #fefbda
		"--color-primary-300": "253 249 196", // #fdf9c4
		"--color-primary-400": "251 245 151", // #fbf597
		"--color-primary-500": "249 240 107", // #f9f06b
		"--color-primary-600": "224 216 96", // #e0d860
		"--color-primary-700": "187 180 80", // #bbb450
		"--color-primary-800": "149 144 64", // #959040
		"--color-primary-900": "122 118 52", // #7a7634
		// secondary | #f8e45c 
		"--color-secondary-50": "254 251 231", // #fefbe7
		"--color-secondary-100": "254 250 222", // #fefade
		"--color-secondary-200": "253 248 214", // #fdf8d6
		"--color-secondary-300": "252 244 190", // #fcf4be
		"--color-secondary-400": "250 236 141", // #faec8d
		"--color-secondary-500": "248 228 92", // #f8e45c
		"--color-secondary-600": "223 205 83", // #dfcd53
		"--color-secondary-700": "186 171 69", // #baab45
		"--color-secondary-800": "149 137 55", // #958937
		"--color-secondary-900": "122 112 45", // #7a702d
		// tertiary | #f6d32d 
		"--color-tertiary-50": "254 248 224", // #fef8e0
		"--color-tertiary-100": "253 246 213", // #fdf6d5
		"--color-tertiary-200": "253 244 203", // #fdf4cb
		"--color-tertiary-300": "251 237 171", // #fbedab
		"--color-tertiary-400": "249 224 108", // #f9e06c
		"--color-tertiary-500": "246 211 45", // #f6d32d
		"--color-tertiary-600": "221 190 41", // #ddbe29
		"--color-tertiary-700": "185 158 34", // #b99e22
		"--color-tertiary-800": "148 127 27", // #947f1b
		"--color-tertiary-900": "121 103 22", // #796716
		// success | #f66151 
		"--color-success-50": "254 231 229", // #fee7e5
		"--color-success-100": "253 223 220", // #fddfdc
		"--color-success-200": "253 216 212", // #fdd8d4
		"--color-success-300": "251 192 185", // #fbc0b9
		"--color-success-400": "249 144 133", // #f99085
		"--color-success-500": "246 97 81", // #f66151
		"--color-success-600": "221 87 73", // #dd5749
		"--color-success-700": "185 73 61", // #b9493d
		"--color-success-800": "148 58 49", // #943a31
		"--color-success-900": "121 48 40", // #793028
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
		// surface | #ffbe6f 
		"--color-surface-50": "255 245 233", // #fff5e9
		"--color-surface-100": "255 242 226", // #fff2e2
		"--color-surface-200": "255 239 219", // #ffefdb
		"--color-surface-300": "255 229 197", // #ffe5c5
		"--color-surface-400": "255 210 154", // #ffd29a
		"--color-surface-500": "255 190 111", // #ffbe6f
		"--color-surface-600": "230 171 100", // #e6ab64
		"--color-surface-700": "191 143 83", // #bf8f53
		"--color-surface-800": "153 114 67", // #997243
		"--color-surface-900": "125 93 54", // #7d5d36
		
	}
}