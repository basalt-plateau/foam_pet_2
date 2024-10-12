


export const Atolls_Theme = {
    name: 'Atolls',
    properties: {
		// =~= Theme Properties =~=
		"--theme-font-family-base": `ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, 'Liberation Mono', 'Courier New', monospace`,
		"--theme-font-family-heading": `ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, 'Liberation Mono', 'Courier New', monospace`,
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
		"--on-surface": "0 0 0",
		// =~= Theme Colors  =~=
		// primary | #d0cfed 
		"--color-primary-50": "248 248 252", // #f8f8fc
		"--color-primary-100": "246 245 251", // #f6f5fb
		"--color-primary-200": "243 243 251", // #f3f3fb
		"--color-primary-300": "236 236 248", // #ececf8
		"--color-primary-400": "222 221 242", // #deddf2
		"--color-primary-500": "208 207 237", // #d0cfed
		"--color-primary-600": "187 186 213", // #bbbad5
		"--color-primary-700": "156 155 178", // #9c9bb2
		"--color-primary-800": "125 124 142", // #7d7c8e
		"--color-primary-900": "102 101 116", // #666574
		// secondary | #8b8ecb 
		"--color-secondary-50": "238 238 247", // #eeeef7
		"--color-secondary-100": "232 232 245", // #e8e8f5
		"--color-secondary-200": "226 227 242", // #e2e3f2
		"--color-secondary-300": "209 210 234", // #d1d2ea
		"--color-secondary-400": "174 176 219", // #aeb0db
		"--color-secondary-500": "139 142 203", // #8b8ecb
		"--color-secondary-600": "125 128 183", // #7d80b7
		"--color-secondary-700": "104 107 152", // #686b98
		"--color-secondary-800": "83 85 122", // #53557a
		"--color-secondary-900": "68 70 99", // #444663
		// tertiary | #9141ac 
		"--color-tertiary-50": "239 227 243", // #efe3f3
		"--color-tertiary-100": "233 217 238", // #e9d9ee
		"--color-tertiary-200": "228 208 234", // #e4d0ea
		"--color-tertiary-300": "211 179 222", // #d3b3de
		"--color-tertiary-400": "178 122 197", // #b27ac5
		"--color-tertiary-500": "145 65 172", // #9141ac
		"--color-tertiary-600": "131 59 155", // #833b9b
		"--color-tertiary-700": "109 49 129", // #6d3181
		"--color-tertiary-800": "87 39 103", // #572767
		"--color-tertiary-900": "71 32 84", // #472054
		// success | #57e389 
		"--color-success-50": "230 251 237", // #e6fbed
		"--color-success-100": "221 249 231", // #ddf9e7
		"--color-success-200": "213 248 226", // #d5f8e2
		"--color-success-300": "188 244 208", // #bcf4d0
		"--color-success-400": "137 235 172", // #89ebac
		"--color-success-500": "87 227 137", // #57e389
		"--color-success-600": "78 204 123", // #4ecc7b
		"--color-success-700": "65 170 103", // #41aa67
		"--color-success-800": "52 136 82", // #348852
		"--color-success-900": "43 111 67", // #2b6f43
		// warning | #ebcd26 
		"--color-warning-50": "252 248 222", // #fcf8de
		"--color-warning-100": "251 245 212", // #fbf5d4
		"--color-warning-200": "250 243 201", // #faf3c9
		"--color-warning-300": "247 235 168", // #f7eba8
		"--color-warning-400": "241 220 103", // #f1dc67
		"--color-warning-500": "235 205 38", // #ebcd26
		"--color-warning-600": "212 185 34", // #d4b922
		"--color-warning-700": "176 154 29", // #b09a1d
		"--color-warning-800": "141 123 23", // #8d7b17
		"--color-warning-900": "115 100 19", // #736413
		// error | #cb6666 
		"--color-error-50": "247 232 232", // #f7e8e8
		"--color-error-100": "245 224 224", // #f5e0e0
		"--color-error-200": "242 217 217", // #f2d9d9
		"--color-error-300": "234 194 194", // #eac2c2
		"--color-error-400": "219 148 148", // #db9494
		"--color-error-500": "203 102 102", // #cb6666
		"--color-error-600": "183 92 92", // #b75c5c
		"--color-error-700": "152 77 77", // #984d4d
		"--color-error-800": "122 61 61", // #7a3d3d
		"--color-error-900": "99 50 50", // #633232
		// surface | #99c1f1 
		"--color-surface-50": "240 246 253", // #f0f6fd
		"--color-surface-100": "235 243 252", // #ebf3fc
		"--color-surface-200": "230 240 252", // #e6f0fc
		"--color-surface-300": "214 230 249", // #d6e6f9
		"--color-surface-400": "184 212 245", // #b8d4f5
		"--color-surface-500": "153 193 241", // #99c1f1
		"--color-surface-600": "138 174 217", // #8aaed9
		"--color-surface-700": "115 145 181", // #7391b5
		"--color-surface-800": "92 116 145", // #5c7491
		"--color-surface-900": "75 95 118", // #4b5f76
		
	}
}