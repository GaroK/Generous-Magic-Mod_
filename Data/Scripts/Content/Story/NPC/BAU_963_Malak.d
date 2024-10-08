

instance BAU_963_Malak (Npc_Default)
{
	// ------ NSC ------
	name 		= "MALAK";
	guild 		= GIL_OUT;
	id 			= 963;
	voice 		= 8;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal_Sly, BodyTex_N, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abh�ngig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 35); //Grenzen f�r Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_963;
};

FUNC VOID Rtn_Start_963 ()
{	
	TA_Stand_Eating		(08,00,22,00,"NW_FARM3_MALAK");
    TA_Stand_Eating		(22,00,08,00,"NW_FARM3_MALAK"); 
};

FUNC VOID Rtn_FleeFromPass_963 ()
{	
	TA_Stand_Eating		(08,00,22,00,"NW_BIGMILL_MALAKSVERSTECK_MALAK");
    TA_Stand_Eating		(22,00,08,00,"NW_BIGMILL_MALAKSVERSTECK_MALAK"); 
};



