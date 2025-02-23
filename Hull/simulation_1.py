




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
	Guest:
		aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_11 String:Topic_1
"""

"""
	Producer:
		aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Producer_Texts::Delete \
		--args address:0x2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd \
		--args String:Topic_1
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
		
		

#
#
#	0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C
#
#		platform, topic, theme, tag, genre
#	
#
def operation_1_producer ():
	operation ([
		"(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key 0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C)",
		"aptos account fund-with-faucet --amount 1000000000",
		
		"aptos move run --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Producer_Hulls::Begin --assume-yes",
		"aptos move view --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Hulls::Status",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_1",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_2",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_3",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_4",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_5",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_6",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_7",
		
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Producer_Hull::Pause --args String:text"
	]);


def operation_2 ():
	operation ([
		"(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key B779524378A5B497896AB4B5A9EA4B7869AB548796AB4B5A694B7796A4B52617) ",
		"aptos account fund-with-faucet --amount 200000000",
		
		"aptos move run --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Producer_Hulls::Begin --assume-yes",
		"aptos move view --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Hulls::Status",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_1",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_2",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_3",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_4",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_5",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_6",
		"aptos move run --assume-yes --function-id 2f75da076414103c721d195b0376c66897593b1f4e961671099a2dc9a24adcfd::Module_Guest_Texts::Send --args String:Text_1 String:Topic_7",
		
		
	]);
	
	
operation_2 ();