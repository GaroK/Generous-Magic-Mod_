instance STRF_1104_Straefling(Npc_Default)
{
	// -------- NPC --------
	name							= NAME_STRAEFLING;
	npctype							= NPCTYPE_AMBIENT;
	guild							= GIL_OUT;
	flags							= 0; // NPC_FLAG_IMMORTAL oder 0

	voice							= 1;
	id								= 1104;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 1); // setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Bald", Face_N_Weak04, BodyTex_N, ITAR_Prisoner);
	Mdl_SetModelFatness(self, 1);
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
	daily_routine = Rtn_Start_1104;
};

func void Rtn_Start_1104()
{
	TA_Pick_Ore(08, 00, 23, 00, "OW_NEWMINE_05");
	TA_Pick_Ore(23, 00, 08, 00, "OW_NEWMINE_05");
};
