instance STRF_1107_Straefling(Npc_Default)
{
	// -------- NPC --------
	name							= "Chef";
	npctype							= NPCTYPE_OCMAIN;
	guild							= GIL_STRF;
	flags							= 0; // NPC_FLAG_IMMORTAL oder 0

	voice							= 1;
	id								= 1107;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 1); // setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Bald", Face_N_NormalBart04, BodyTex_N, ITAR_Prisoner);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMDS(self, "Humans_Tired.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_COWARD; // MASTER / STRONG / COWARD

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 15); // Grenzen fÃƒÂ¼r Talent-Level liegen bei 30 und 60

	// -------- inventory --------
	B_CreateAmbientInv(self);

	// -------- equipped weapons --------
	EquipItem(self, ItMw_2H_Axe_L_01);

	// -------- daily routine --------
	daily_routine = Rtn_Start_1107;
};

func void Rtn_Start_1107()
{
	TA_Cook_Cauldron(08, 00, 23, 00, "OC_EBR_KITCHEN_COOK");
	TA_Cook_Cauldron(23, 00, 08, 00, "OC_EBR_KITCHEN_COOK");
};
