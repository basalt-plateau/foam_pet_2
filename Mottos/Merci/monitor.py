



import os



estate_1 = {
	"private key": "0C1218C9ABC123C812359A89ABC5C565C89EABCAD9E8CBE9F8CBE9DABC8F152C",
	"legacy address": "4B1082B9C8F6250E01ACB41AA4D2EFCE56A1278EE2309FEFDBF0D5C59E5AC5E3"
}
estate_2 = {
	"private key": "B89ABC50712653C071625BC8F9EADBC8F9EDACB706152CBF89EDABC1625BC261",
	"legacy address": "E7CB1E9B8FA8ADFF1C3720FA9C36A150E8F08B6E864FF5CB102F6ECCF5FE9BA3"
}
estate_3 = {
	"private key": "2105BC9EADBC8F9EADBC1625BC9EADBC8E9DACB8FE9ADBC172365ABC9EADBC8F",
	"legacy address": "8F61659675B8040A55513F441DA2D6F039A2188A49F7ADA69E9C7FBD4A952C7E"
}

Merci = " ".join ([
	"cd /Metro/Mottos/Merci",
	"&&",
	"aptos move test",
	f"""--named-addresses 'ride_1={ estate_1 ["legacy address"] }, ride_2={ estate_2 ["legacy address"] }, ride_3={ estate_3 ["legacy address"] }'"""
])


os.system (Merci)



