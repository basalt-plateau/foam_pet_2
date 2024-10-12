




////
//
import { AppRail, AppRailTile, AppRailAnchor } from '@skeletonlabs/skeleton';
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
//
//

import { check_roomies_truck } from '$lib/Versies/Trucks'
//
//
import { parse_styles } from '$lib/trinkets/styles/parse'
//
////

////
//
//	Modals
//
import Layer_Octas_Gifts_Friends from '$lib/Les_Talents/APT_Entrust_Mode_1/Friends_Panel/Trinket.svelte'
import Layer_Faucet from '$lib/Les_Talents/Faucet/Trinket.svelte'
import Les_Talents_Coin_Transfer_Mode_1 from '$lib/Les_Talents/Coin_Transfer_Mode_1/Friends_Move/Trinket.svelte'
import Transaction_Modal from '$lib/Les_Talents/Transaction/Friends_Move/Trinket.svelte'
import Address_Search_Modal from '$lib/Les_Talents/Address_Search/Trinket.svelte'
//
////



export const modal_plugs = ({
	modal_store
}) => {
	const octas_gifts_v1 = () => {
		console.log ('sending from account_1 to account_2')	
		
		modal_store.trigger ({
			type: 'component',
			
			backdropClasses: '!p-0 !fixed',
			
			component: {
				ref: Layer_Octas_Gifts_Friends,
				props: { 
					modal_store
				}
			}
		});
	}
	
	

	const open_faucet = () => {
		modal_store.trigger ({
			type: 'component',
			
			backdropClasses: '!p-0',
			
			component: {
				ref: Layer_Faucet,
				props: { 
					modal_store
				}
			}
		});
	}
	
	const open_transaction_modal = () => {
		modal_store.trigger ({
			type: 'component',
			
			backdropClasses: '!p-0',
			
			component: {
				ref: Transaction_Modal,
				props: { 
					modal_store
				}
			}
		});
	}

	const open_coin_transfer = () => {
		modal_store.trigger ({
			type: 'component',
			backdropClasses: '!p-0',
			component: {
				ref: Les_Talents_Coin_Transfer_Mode_1,
				props: { 
					modal_store
				}
			}
		});
	}
	
	return {
		octas_gifts_v1,
		open_faucet,
		open_transaction_modal,
		open_coin_transfer,
		open_address_search: () => {
			console.log ('sending from account_1 to account_2')	
			
			modal_store.trigger ({
				type: 'component',
				backdropClasses: '!p-0 !fixed',
				component: {
					ref: Address_Search_Modal,
					props: { 
						modal_store
					}
				}
			});
		}
	}
}

export const trends = {
	panel: {
		position: 'relative',
		display: 'inline-flex',
		//'width': '33%', 
		'height': '200px',
		'align-items': 'center',
		'justify-content': 'center',
		'flex-direction': 'column'
	},
	anchor: parse_styles ({
		position: 'absolute',
		height: '100%',
		width: '100%',
		
		display: 'flex',
		'align-items': 'center',
		'justify-content': 'center',
		'text-decoration': 'none',
		'text-align': 'center',
		'font-size': '2em'
	})
}
