






def build_type_args (bracket):
	if (len (bracket) >= 1):
		return ' '.join ([
			f'--type-args',
			* bracket
		])

	return ''



''''
	args = build_args ([
		f'u64:{ amount }',
	])
"'''
def build_args (bracket):
	if (len (bracket) >= 1):
		return ' '.join ([
			f'--args',
			* bracket
		])

	return ''