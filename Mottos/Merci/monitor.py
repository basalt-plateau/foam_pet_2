



import os



estate_1 = {
	"private key": "B8D9ACABF8E9DACB61523478E9DABC8F9EADBC16234770E8CBE9DACBF8615234",
	"legacy address": "150755A53B2FD604F5072BDF22C2F1DCA1D9D730D1AFAF460A3D8C8E16528C5F"
}
estate_2 = {
	"private key": "B89ABC50712653C071625BC8F9EADBC8F9EDACB706152CBF89EDABC1625BC261",
	"legacy address": "E7CB1E9B8FA8ADFF1C3720FA9C36A150E8F08B6E864FF5CB102F6ECCF5FE9BA3"
}
estate_3 = {
	"private key": "2105BC9EADBC8F9EADBC1625BC9EADBC8E9DACB8FE9ADBC172365ABC9EADBC8F",
	"legacy address": "8F61659675B8040A55513F441DA2D6F039A2188A49F7ADA69E9C7FBD4A952C7E"
}

filter = ""
filter = "--filter Merci_Tienda_Steady_1"
filter = "--filter Merci_Steady_1"

Merci = " ".join ([
	"cd /Metro/Mottos/Merci",
	"&&",
	"aptos move test",
	filter,
	f"""--named-addresses 'ride_1={ estate_1 ["legacy address"] }, ride_2={ estate_2 ["legacy address"] }, ride_3={ estate_3 ["legacy address"] }'"""
])


os.system (Merci)



