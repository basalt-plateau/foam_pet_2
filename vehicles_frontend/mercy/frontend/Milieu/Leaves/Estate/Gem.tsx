
////
//
import React, { useState, useEffect, Component } from 'react';
import { useWallet } from "@aptos-labs/wallet-adapter-react";
//
//
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
//
import { NetworkInfo } from "@/components/NetworkInfo";
import { AccountInfo } from "@/components/AccountInfo";
//
import * as Truck_1 from '@/Truck_1'
//
//
import { WalletDetails } from "./Gems/Wallet_Details";
//
////
import { check_signatory_connection } from "@/Signatory/is_connected"

export default class Leaf extends Component {
    constructor (props) {
        super (props);
		
        this.state = { 
			count: 0
		};
    }

    render () {
		const { connected } = this.state;
		
		if (connected !== "yes") {
			return (
				<CardHeader>
					<CardTitle
						style={{
							"padding": "1cm",
							"fontSize": "2em"
						}}
					>There is not an estate linked.</CardTitle>
				</CardHeader>
			)
		}
		
        return (
			<div>
				<Card>
					<CardContent className="flex flex-col gap-10 pt-6">
						<WalletDetails />
					</CardContent>
				</Card>
				<div style={{ height: '1cm' }} />
				<Card>
					<CardContent className="flex flex-col gap-10 pt-6">
						<NetworkInfo />
					</CardContent>
				</Card>
				<div style={{ height: '1cm' }} />
				<Card>
					<CardContent className="flex flex-col gap-10 pt-6">
						<AccountInfo />
					</CardContent>
				</Card>
				<div style={{ height: '5cm' }} />
			</div>
        );
    }
	
	async componentDidMount () {
		this.Truck_1_Freight = Truck_1.retrieve ().freight;
		this.Truck_1_Monitor = Truck_1.monitor (async ({
			original_freight,
			pro_freight, 
			//
			target,
			//
			property, 
			value
		}) => {
			console.log ("header truck 1 monitor");
			
			try {
				// watch for changes to leaf_name
				if (target === original_freight && property === "leaf_name") {
					console.info ("leaf name changed", value);
				}
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		});	
		
		const wallet_link = this.Truck_1_Freight.wallet_link;
		const is_connected = await check_signatory_connection ({ wallet_link });
		
		this.setState ({
			connected: is_connected
		});
	}
	
	componentWillUnmount () {
		this.Truck_1_Monitor.stop ()
	}
}
