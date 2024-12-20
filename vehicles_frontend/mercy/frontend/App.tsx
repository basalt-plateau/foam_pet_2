


import React, { useState, useEffect, Component } from 'react';

import { useWallet } from "@aptos-labs/wallet-adapter-react";


// Internal Components
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { WalletDetails } from "@/components/WalletDetails";
import { NetworkInfo } from "@/components/NetworkInfo";
import { AccountInfo } from "@/components/AccountInfo";
import { TransferAPT } from "@/components/TransferAPT";
import { MessageBoard } from "@/components/MessageBoard";

//
import { Header } from "@/Milieu/Header";
import { Leaf } from "@/Milieu/Leaf/Estate.tsx";

import * as Truck_1 from '@/Truck_1'


export class App extends Component {
    constructor (props) {
        super (props);
		this.state = {
			Truck_1_Prepared: "no"
		}
    }


    render () {
		const { Truck_1_Prepared } = this.state;
		
		return (
			<>
				{ Truck_1_Prepared === "yes" ? (
				<>
					<Header />
					<Leaf/>
				</>
				) : <></> }
			</>
		);
    }
	
	async componentDidMount () {
		// console.log ('Dapp onMount');
		await Truck_1.make ()
		
		this.setState ({
			Truck_1_Prepared: "yes"
		});
	}
	
	componentWillUnmount () {
		// console.log ('Dapp onDestroy');
		Truck_1.destroy ();
		
		this.setState ({
			Truck_1_Prepared: "no"
		});
	}
}


export default App;
