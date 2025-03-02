instance DJG_732_ToterDrachenjaeger(Npc_Default)
{
	// -------- NPC --------
	name							= NAME_ToterDrachenjaeger;
	npctype							= NPCTYPE_AMBIENT;
	guild							= GIL_DJG;
	flags							= 0; // NPC_FLAG_IMMORTAL oder 0

	voice							= 5;
	id								= 732;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 4); // setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Bald", Face_B_Tough_Pacho, BodyTex_B, ITAR_DJG_M);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMDS(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_STRONG; // MASTER / STRONG / COWARD

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 70); // Grenzen fÃƒÂ¼r Talent-Level liegen bei 30 und 60

	// -------- inventory --------
	B_CreateAmbientInv(self);

	// -------- equipped weapons --------
	EquipItem(self, ItMw_2H_SLD_Axe);

	// -------- daily routine --------
	daily_routine = Rtn_Start_732;
};

func void Rtn_Start_732()
{
	TA_Sit_Bench(08, 00, 23, 00, "OW_PATH_065"); // Joly: vor Iceregion
	TA_Sit_Bench(23, 00, 08, 00, "OW_PATH_066");
};
