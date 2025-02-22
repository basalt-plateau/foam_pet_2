
"""
	(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key 0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C) 
	aptos account fund-with-faucet --amount 1000000000
	aptos move run --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Producer_Hulls::Begin --assume-yes
	aptos move view --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Hulls::Status
	aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Platform_1 String:Text_1
"""

"""
	(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key B4079EADBC8F9EACB0712365BC9EADBC8F9EADBC0712365BC9EADBC8F9EADBC8) 
	aptos account fund-with-faucet --amount 1000000000
	aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Platform_1 String:Text_1
	aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Platform_1 String:Text_2
"""


"""
	" ".join ([
		"(cd /Metro/Hull",
		"&& aptos init --assume-yes --network devnet",
		"--private-key 0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C)"
	]),
"""

import os

def operation (plays):
	for play in plays:
		print (f"play: '{ play }'")
	
		os.system (play)
		
		

operation ([
	"(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key 0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C) ",
	"aptos account fund-with-faucet --amount 1000000000",
	"aptos move run --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Producer_Hulls::Begin --assume-yes",
	"aptos move view --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Hulls::Status",
	"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Platform_1 String:Text_1"
]);

