var int Engor_ItemsGiven_Chapter_1;
var int Engor_ItemsGiven_Chapter_2;
var int Engor_ItemsGiven_Chapter_3;
var int Engor_ItemsGiven_Chapter_4;
var int Engor_ItemsGiven_Chapter_5;

func void B_GiveTradeInv_Engor(var C_Npc slf)
{
	if ((Kapitel >= 1)
	&& (Engor_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems(slf, ItMi_Gold, 80);
		CreateInvItems(slf, ItMiSwordraw, 3);
		CreateInvItems(slf, ItPo_Health_01, 10);
		CreateInvItems(slf, ItPo_Health_02, 5);
		CreateInvItems(slf, ItPo_Health_03, 5);
		CreateInvItems(slf, ItFo_Stew, 5);
		CreateInvItems(slf, ItFo_Water, 4);
		// - Map -
		CreateInvItems(slf, ItWr_Map_Oldworld, 1);

		CreateInvItems(slf, ItRi_Prot_Total_01, 1);
		CreateInvItems(slf, ItAm_Prot_Fire_01, 1);

		// ------ Scrolls ------
		CreateInvItems(slf, ItSc_Firebolt, 3);
		CreateInvItems(slf, ItSc_Icebolt, 3);
		CreateInvItems(slf, ItSc_MediumHeal, 2);
		CreateInvItems(slf, ItSc_Firestorm, 3);
		CreateInvItems(slf, ItSc_LightningFlash, 1);
		CreateInvItems(slf, ItSc_SumGol, 2);
		CreateInvItems(slf, ItSc_Pyrokinesis, 1);
		CreateInvItems(slf, ItSc_SumDemon, 1);

		//------ Paladin Zauber ------
		CreateInvItems (slf,ItSc_PalHolyBolt ,  2); 
		CreateInvItems (slf,ItSc_PalMediumHeal , 1);
		CreateInvItems (slf,ItSc_PalLight, 10); 
		
		// ------ ArmbrÃƒÂ¼ste -------
		CreateInvItems(slf, ItRw_Crossbow_L_01, 1);
		CreateInvItems(slf, ItRw_Crossbow_L_02, 1);

		CreateInvItems(slf, ItRw_Crossbow_H_01, 1);

		Engor_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2) // Joly: wird eh erst ab 2. Kapitel vom SC erreicht.
	&& (Engor_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems(slf, ItMi_Gold, 90);
		CreateInvItems(slf, ItPo_Health_02, 1);
		CreateInvItems(slf, ItPo_Health_01, 10);
		CreateInvItems(slf, ItPo_Health_02, 5);
		CreateInvItems(slf, ItPo_Health_03, 5);
		CreateInvItems (slf, ItPo_Mana_01,	30);//Joly:hab ich schon eingefÃƒÂ¼gt nach version 1.26e
		CreateInvItems (slf, ItPo_Mana_02,	30);
		CreateInvItems(slf, ItFo_Sausage, 1);
		CreateInvItems(slf, ItFo_Booze, 5);
		CreateInvItems(slf, ItFo_Wine, 2);
		CreateInvItems(slf, ItFo_Bread, 1);
		CreateInvItems(slf, ItRw_Arrow, 55);
		CreateInvItems(slf, ItRw_Bolt, 50);
		CreateInvItems(slf, ItMi_Sulfur, 1);
		CreateInvItems(slf, ItMi_Quartz, 2);
		CreateInvItems(slf, ItKE_Lockpick, 6);

		CreateInvItems(slf, ItRw_Crossbow_M_01, 1);
		
		//------ Paladin Zauber ------
		CreateInvItems (slf,ItSc_PalHolyBolt ,  2); 
		CreateInvItems (slf,ItSc_PalMediumHeal , 1);
		CreateInvItems (slf,ItSc_PalRepelEvil , 1);
		CreateInvItems (slf,ItSc_PalFullHeal , 1);

		Engor_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Engor_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems(slf, ItMi_Gold, 100);
		CreateInvItems(slf, ItFo_Wine, 4);
		CreateInvItems(slf, ItPo_Health_01, 10);
		CreateInvItems(slf, ItPo_Health_02, 5);
		CreateInvItems(slf, ItPo_Health_03, 5);
		CreateInvItems (slf, ItPo_Mana_01,	30);
		CreateInvItems (slf, ItPo_Mana_02,	30);
		CreateInvItems(slf, ItMi_Pitch, 2);
		CreateInvItems(slf, ItMi_Rockcrystal, 1);
		CreateInvItems(slf, ItMi_Coal, 2);
		CreateInvItems(slf, ItRw_Arrow, 70);
		CreateInvItems(slf, ItRw_Bolt, 70);
		CreateInvItems(slf, ItKE_Lockpick, 6);

		CreateInvItems(slf, ItRw_Crossbow_M_02, 1);
		
		//------ Paladin Zauber ------
		CreateInvItems (slf,ItSc_PalHolyBolt ,  2); 
		CreateInvItems (slf,ItSc_PalMediumHeal , 1);
		CreateInvItems (slf,ItSc_PalRepelEvil , 1);
		CreateInvItems (slf,ItSc_PalFullHeal , 2);

		Engor_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Engor_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems(slf, ItMi_Gold, 150);
		CreateInvItems(slf, ItPo_Health_01, 10);
		CreateInvItems(slf, ItPo_Health_02, 5);
		CreateInvItems(slf, ItPo_Health_03, 5);
		CreateInvItems (slf, ItPo_Mana_01,	30);
		CreateInvItems (slf, ItPo_Mana_02,	30);
		CreateInvItems(slf, ItMi_Pitch, 2);
		CreateInvItems(slf, ItMi_Rockcrystal, 1);
		CreateInvItems(slf, ItMi_Coal, 1);
		CreateInvItems(slf, ItRw_Arrow, 100);
		CreateInvItems(slf, ItRw_Bolt, 110);
		CreateInvItems(slf, ItKE_Lockpick, 12);
		CreateInvItems   (slf, ItSc_IceWave, 2);

		CreateInvItems(slf, ItRw_Crossbow_H_02, 1);

		//------ Paladin Zauber ------
		CreateInvItems (slf,ItSc_PalHolyBolt ,  2); 
		CreateInvItems (slf,ItSc_PalMediumHeal , 1);
		CreateInvItems (slf,ItSc_PalDestroyEvil , 1);
		CreateInvItems (slf,ItSc_PalRepelEvil , 2);
		CreateInvItems (slf,ItSc_PalFullHeal , 3);

		Engor_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Engor_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems(slf, ItMi_Gold, 200);
		CreateInvItems(slf, ItPo_Health_01, 10);
		CreateInvItems(slf, ItPo_Health_02, 5);
		CreateInvItems(slf, ItPo_Health_03, 5);
		CreateInvItems (slf, ItPo_Mana_01,	40);
		CreateInvItems (slf, ItPo_Mana_02,	40);
		CreateInvItems(slf, ItMi_Aquamarine, 1);
		CreateInvItems(slf, ItMi_DarkPearl, 1);
		CreateInvItems(slf, ItMi_Coal, 4);
		CreateInvItems(slf, ItRw_Arrow, 125);
		CreateInvItems(slf, ItRw_Bolt, 125);
		
		//------ Paladin Zauber ------
		CreateInvItems (slf,ItSc_PalHolyBolt ,  2); 
		CreateInvItems (slf,ItSc_PalMediumHeal , 1);
		CreateInvItems (slf,ItSc_PalDestroyEvil , 2);
		CreateInvItems (slf,ItSc_PalRepelEvil , 3);
		CreateInvItems (slf,ItSc_PalFullHeal , 2);

		Engor_ItemsGiven_Chapter_5 = TRUE;
	};
};
