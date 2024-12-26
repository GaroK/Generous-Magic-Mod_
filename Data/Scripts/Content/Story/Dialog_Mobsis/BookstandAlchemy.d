//##########################################################################
//##
//##	Bookstand Alchemie
//##
//##########################################################################

//----------------------
var int ALchemy_1_permanent;
//----------------------
//----------------------
var int ALchemy_2_permanent;
//----------------------
//----------------------
var int ALchemy_3_permanent;
//----------------------

FUNC VOID Use_BookstandALCHEMY1_S1()		//Alchemieb�cher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Potions of Magic Power");
					Doc_PrintLine	( nDocID,  0, "and Ingredients"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Mana Essence"						);
					Doc_PrintLine	( nDocID,  0, "2 Fire Nettles"						);
					Doc_PrintLine	( nDocID,  0, "1 Forest Berry"							);
					Doc_PrintLine	( nDocID,  0, ""							);
					Doc_PrintLine	( nDocID,  0, "Mana Extract"						);
					Doc_PrintLine	( nDocID,  0, "2 Fireweeds"						);
					Doc_PrintLine	( nDocID,  0, "1 Blue Elder"						);
					Doc_PrintLine	( nDocID,  0, ""							);
					Doc_PrintLine	( nDocID,  0, "Mana Elixir"						);
					Doc_PrintLine	( nDocID,  0, "2 Fire Roots"						);
					Doc_PrintLine	( nDocID,  0, "1 Meadow Knotweed"						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "All work at the alchemist's bench requires a laboratory flask which is used up in the process."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "To brew any healing potions or potions to strengthen magic power, you need a proper mixture of plants:"			);
					Doc_PrintLine	( nDocID,  1, "healing plants and fire plant, combined with Blue Elder for small and medium potions."		);
					Doc_PrintLine	( nDocID,  1, "Stronger potions call for Meadow Knotweed."						);
					Doc_PrintLines	( nDocID,  1, "To brew any potions that effect permanent changes to the body or spirit, you need a certain plant:"						);
					Doc_PrintLines	( nDocID,  1, "King's Sorrel, Meadow Knotweed."		);
					Doc_Show		( nDocID );
					
					if (ALchemy_1_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_1_permanent = TRUE;
					};	  

	};
};

FUNC VOID Use_BookstandALCHEMY2_S1()		//Alchemieb�cher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Healing Potions");
					Doc_PrintLine	( nDocID,  0, "and Ingredients"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Essence of Healing"						);
					Doc_PrintLine	( nDocID,  0, "2 Healing Plants"						);
					Doc_PrintLine	( nDocID,  0, "1 Woodland Berry"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Extract of Healing"						);
					Doc_PrintLine	( nDocID,  0, "2 Healing Herbs"						);
					Doc_PrintLine	( nDocID,  0, "1 Blue Elder"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elixir of Healing"						);
					Doc_PrintLine	( nDocID,  0, "2 Healing Roots"						);
					Doc_PrintLine	( nDocID,  0, "1 Meadow Knotweed"						);
					
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "All work at the alchemist's bench requires a laboratory flask which is used up in the process."	); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "To brew any healing potions or potions to strengthen magic power, you need a proper mixture of plants:"			);
					Doc_PrintLine	( nDocID,  1, "healing plants and fire plant, combined with Blue Elder for small and medium potions."		);
					Doc_PrintLine	( nDocID,  1, "Stronger potions call for Meadow Knotweed."						);
					Doc_PrintLines	( nDocID,  1, "To brew any potions that effect permanent changes to the body or spirit, you need a certain plant:"						);
					Doc_PrintLines	( nDocID,  1, "King's Sorrel, Meadow Knotweed."		);
					Doc_Show		( nDocID );
					
					if (ALchemy_2_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_2_permanent = TRUE;
					};	

	};
};

FUNC VOID Use_BookstandALCHEMY3_S1()		//Alchemieb�cher
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0	);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   				); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   	);  	

					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Potions for Permanent Changes");
					Doc_PrintLine	( nDocID,  0, "and Ingredients"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					
					
					Doc_PrintLine	( nDocID,  0, "Elixir of Dexterity"						);
					Doc_PrintLine	( nDocID,  0, "1 goblin berry, 1 meadow knotweed"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Speed Potion"						);
					Doc_PrintLines	( nDocID,  0, "1 snapperweed - This potion requires not king's sorrel, but meadow knotweed."						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLine	( nDocID,  0, "Elixir of Strength"						);
					Doc_PrintLine	( nDocID,  0, "1 dragonroot, 1 meadow knotweed"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Elixir of Life"						);
					Doc_PrintLine	( nDocID,  0, "1 healing root, 1 meadow knotweed"						);
					Doc_PrintLine	( nDocID,  0, ""						);
					Doc_PrintLines	( nDocID,  0, "Elixir of Spirit"						);
					Doc_PrintLine	( nDocID,  0, "1 fire root, 1 meadow knotweed"						);
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "Brewing these recipes is the highest art of alchemy. They all have the use of king's sorrel and meadow knotweed as an ingredients in common."); 
					Doc_PrintLine	( nDocID,  1, ""						);
					Doc_PrintLines	( nDocID,  1, "The potion of speed is much simpler to create which is also due to the fact that you do not need king's sorrel."						);
					Doc_PrintLine	( nDocID,  1, ""						);
					
					
					Doc_Show		( nDocID );
					
					if (ALchemy_3_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);
						ALchemy_3_permanent = TRUE;
					};	

	};
};
