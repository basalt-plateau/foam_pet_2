


module Ride_01::Allowed_Wallets_Vows {
	#[view] public fun Volitions () : String { use Ride_01::Rules_10; Rules_10::Volitions_01 () }
	
	use Ride_01::Allowed_Wallets;
	
	#[test (
		boar_Producer_1_consenter = @Boar_Producer_1,
	)]
	public fun steady (
		boar_Producer_1_consenter : signer
	) {	
		Allowed_Wallets::establish (boar_Producer_1_consenter)
	}
}