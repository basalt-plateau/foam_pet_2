


import React, { Component, useState, useEffect } from 'react';
import * as Truck_1 from '@/Truck_1'

import { Flex, Text, Button } from "@radix-ui/themes";

import { Wallet_Chooser_Opener } from "@/Signatory/__Wallet_Chooser_Opener/Estate.tsx"

export class Header extends Component {
    constructor (props) {
        super (props);
        this.state = { 
			count: 0 
		};

    }


    render () {
		const { leaf_name } = this.state;
		
        return (
            <div 
				style={{
					background: "black"
				}}
				className="flex items-center justify-between px-4 py-2 max-w-screen-xl mx-auto w-full flex-wrap"
			>
				<div></div>
				
				<div
					style={{
						display: 'flex',
						justifyItems: 'center',
						alignItems: 'center',
						gap: '1cm'
					}}
				>
					<Button 
						color="orange"
						disabled={ leaf_name === "mercy" }
						variant="classic"
						size="4"
						onClick={() => {
							this.Truck_1_Freight.leaf_name = "mercy";
						}}
					>Mercy</Button>
					<Button
						color="orange"
						disabled={ leaf_name === "send" }
						variant="classic"
						size="4"
						onClick={() => {
							this.Truck_1_Freight.leaf_name = "send";
						}}
					>Send</Button>
					<Button
						color="orange"
						disabled={ leaf_name === "Fleeting" }
						variant="classic"
						size="4"
						onClick={() => {
							this.Truck_1_Freight.leaf_name = "Fleeting";
						}}
					>Fleeting</Button>
					<Button
						color="orange"
						disabled={ leaf_name === "estate" }
						variant="classic"
						size="4"
						onClick={() => {
							this.Truck_1_Freight.leaf_name = "estate";
						}}
					>Estate</Button>
					<Button
						color="orange"
						disabled={ leaf_name === "harvest" }
						variant="classic"
						size="4"
						onClick={() => {
							this.Truck_1_Freight.leaf_name = "harvest";
						}}
					>Harvest</Button>
				</div>

				<div className="flex gap-2 items-center flex-wrap">			
					<Wallet_Chooser_Opener />
				</div>
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
					this.setState ({
						leaf_name: value
					});
				}
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		});	
		
		this.setState ({
			leaf_name: Truck_1.retrieve ().freight.leaf_name
		});
	}
	
	componentWillUnmount () {
		this.Truck_1_Monitor.stop ()
	}
}
