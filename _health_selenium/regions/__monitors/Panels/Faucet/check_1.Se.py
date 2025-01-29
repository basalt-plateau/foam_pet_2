





#
#
#	python3 health.proc.py run --path="Moves/Faucet/check_1.Se.py"
#
#

''''
	* open the ICAN Domain Address
	
	* change the inputs:
		* devnet
		

"'''

from vivaciousness.procedures.Faucet.Give import give_Octas_from_faucet


def perfection_1 ():

	give_Octas_from_faucet ({
		"icann_faucet_net_address": "https://faucet.devnet.aptoslabs.com/mint",
		"amount_of_octas": "1e4",
		"to_address": "522D906C609A3D23B90F072AD0DC74BF857FB002E211B852CE38AD6761D4C8FD"
	})
	
	
	

	
checks = {
	'Can faucet 1e4 perfectly': perfection_1
}