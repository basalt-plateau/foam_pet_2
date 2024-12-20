
////
//
import React, { useState, useEffect, Component } from 'react';
//
import { useWallet } from "@aptos-labs/wallet-adapter-react";
//
//
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
//
import { TransferAPT } from "@/components/TransferAPT";
//
import * as Truck_1 from '@/Truck_1'
//
//
import { WalletDetails } from "./Gems/Wallet_Details";
//
////

export default class Leaf extends Component {
    constructor (props) {
        super (props);
		
        this.state = {};
    }

    render () {
		const { connected } = this.props;
		
		if (connected !== true) {
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
				<div style={{ height: '1cm' }} />
				<Card>
					<CardContent className="flex flex-col gap-10 pt-6">
						<TransferAPT />
					</CardContent>
				</Card>
				<div style={{ height: '5cm' }} />
			</div>
        );
    }
	
	componentDidMount () {
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
					
					this.setState (() => ({
						show_leaf: value
					}));
				}
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		});	
	}
	
	componentWillUnmount () {
		this.Truck_1_Monitor.stop ()
	}
}
