




"""
	(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key 0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C) 
	aptos account fund-with-faucet --amount 1000000000
	aptos move run --function-id { Build_Address }::Module_Producer_Hulls::Begin --assume-yes
	aptos move view --function-id { Build_Address }::Module_Guest_Hulls::Status
	aptos move run --assume-yes --function-id { Build_Address }::Module_Guest_Texts::Send --args String:Platform_1 String:Text_1
"""

"""
	(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key B4079EADBC8F9EACB0712365BC9EADBC8F9EADBC0712365BC9EADBC8F9EADBC8) 
	aptos account fund-with-faucet --amount 1000000000
	aptos move run --assume-yes --function-id { Build_Address }::Module_Guest_Texts::Send --args String:Platform_1 String:Text_1
	aptos move run --assume-yes --function-id { Build_Address }::Module_Guest_Texts::Send --args String:Platform_1 String:Text_2
"""

"""
	Guest:
		aptos move run --assume-yes --function-id { Build_Address }::Module_Guest_Texts::Send --args String:Text_11 String:Topic_1
"""

"""
	Producer:
		Delete Text:
			aptos move run --assume-yes --function-id { Build_Address }::Module_Producer_Texts::Delete \
			--args address:0x{ Build_Address } \
			--args String:Topic_1
			
		Delete Text with Refund:
			aptos account fund-with-faucet --amount 1000000000
			
			aptos move run --assume-yes --function-id { Build_Address }::Module_Producer_Texts::Delete_with_Refund \
			--args address:0xC2C8122F7AC679D06BF31CEDA9F8AEFD382DB97A63D403C1686BFBA1BE5F25B5 \
			--args String:Topic_1 \
			--args u64:100000000
			
		Delete Every Text on Platform:
			aptos move run --assume-yes --function-id { Build_Address }::Module_Producer_Hull::Delete \
			--args String:Topic_2
			
		Delete Platform:
			aptos move run --assume-yes --function-id { Build_Address }::Module_Producer_Hull::Delete \
			--args String:"platform 2"
"""




"""
	" ".join ([
		"(cd /Metro/Hull",
		"&& aptos init --assume-yes --network devnet",
		"--private-key 0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C)"
	])
"""

import os

def movie (plays):
	for play in plays:
		print (f"play: '{ play }'")
		os.system (play)
		
		

Build_Address = "DE5FBA4CB03AB1F6565E2864428140384C0982826511D49921E9744CE81978D7";

#
#		
#	Private Key: 	0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C
#	Address: 		{ Build_Address }
#		
#		platform, topic, theme, tag, genre
#	
#
def movie_1_producer ():
	"""
		(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key 0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C) 
	"""
	movie ([
		"(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key 0C1218C9ABC123C812359AB7689AB765C89EABCAD9E8CBE9F8CBE9DABC8F152C)",
		"aptos account fund-with-faucet --amount 1000000000",
		
		f"aptos move run --function-id { Build_Address }::Module_Producer_Hulls::Begin --assume-yes",
		f"aptos move view --function-id { Build_Address }::Module_Guest_Hulls::Status",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Guest_Texts::Send --args String:Text_1 String:Topic_1",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Guest_Texts::Send --args String:Text_1 String:Topic_2",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Guest_Texts::Send --args String:Text_1 String:Topic_3",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Guest_Texts::Send --args String:Text_1 String:Topic_4",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Guest_Texts::Send --args String:Text_1 String:Topic_5",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Guest_Texts::Send --args String:Text_1 String:Topic_6",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Guest_Texts::Send --args String:Text_1 String:Topic_7",
		
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Producer_Hull::Pause --args String:text"
	]);


def begin ():
	movie ([
		f"aptos move run --function-id { Build_Address }::Module_Producer_Hulls::Begin --assume-yes",
		f"aptos move view --function-id { Build_Address }::Module_Guest_Hulls::Status"
	]);

#
#
#	Private Key: 	570045bf3eb84689fa69d44bd9cc1240fad8c4800d20e1eb357b1ca391373bd2
#	Address: 		107FE0B11FFC4B9E809FDAC162E3308A8EBA406F246C8ED083AFBD669C0BDD8F
#
#
def movie_2 ():
	movie ([
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Denizen_Texts::Send_Text --args String:Text_1 String:Topic_1",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Denizen_Texts::Send_Text --args String:Text_1 String:Topic_2",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Denizen_Texts::Send_Text --args String:Text_1 String:Topic_3",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Denizen_Texts::Send_Text --args String:Text_1 String:Topic_4",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Denizen_Texts::Send_Text --args String:Text_1 String:Topic_5",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Denizen_Texts::Send_Text --args String:Text_1 String:Topic_6",
		f"aptos move run --assume-yes --function-id { Build_Address }::Module_Denizen_Texts::Send_Text --args String:Text_1 String:Topic_7",
	]);
	
def open_account ():
	movie ([
		"(cd /Metro/Hull && aptos init --assume-yes --network devnet --private-key B779524378A5B497896AB4B5A9EA4B7869AB548796AB4B5A694B7796A4B52617) ",
		"aptos account fund-with-faucet --amount 200000000"
	]);
	
movie_2 ();