

/*

*/

export const technicians_leaves = {
	"Leaf": async () => { return await import ('./Trinket.svelte') },

	//
	//

	"Adaptation": async () => { return await import ('./Adaptation/Trinket.svelte') },
	"Adaptation Prebuilt": async () => { return await import ('./Adaptation Prebuilt/Trinket.svelte') },

	"Address Qualities": async () => { return await import ('./Address_Qualities/Trinket.svelte') },
	"Address Qualities with Address": async () => { return await import ('./Address_Qualities_with_Address/Trinket.svelte') },

	"APT Petition Button": async () => { return await import ('./APT_Petition_Button/Tome.svelte') },


	"Amount Field": async () => { return await import ('./Amount_Field/Trinket.svelte') },		
	"Consensus Transactions": async () => { return await import ('./Consensus_Transactions/Trinket.svelte') },		
	"Hone Focus": async () => { return await import ('./Hone_Focus/Trinket.svelte') },
	"Net Choices with Text": async () => { return await import ('./Net_Choices_with_Text/Trinket.svelte') },		
	"Net Choices": async () => { return await import ('./Nets_Choices/Trinket.svelte') },		
	"Polytope": async () => { return await import ('./Polytope/Trinket.svelte') },		

	"Slang": async () => { return await import ('./Slang/Trinket.svelte') },

	"Field": async () => { return await import ('./Field/Trinket.svelte') },
};


