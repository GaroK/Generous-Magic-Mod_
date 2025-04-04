instance DJG_705_Angar(Npc_Default)
{
	// -------- NPC --------
	name							= "Angar";
	npctype							= NpcType_Main;
	guild							= GIL_DJG;
	flags							= 0; // NPC_FLAG_IMMORTAL oder 0

	voice							= 4;
	id								= 705;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 6); // setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Bald", Face_B_CorAngar, BodyTex_B, ITAR_CorAngar);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMDS(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_MASTER; // MASTER / STRONG / COWARD

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 80); // Grenzen fÃƒÂ¼r Talent-Level liegen bei 30 und 60

	// -------- inventory --------
	B_CreateAmbientInv(self);
	CreateInvItems(self, ItPo_Health_03, 6);
	CreateInvItems(self, ItMi_OldCoin, 1); // Joly: damit man seine Leiche findet, wenn er im Kampf stirbt!

	// -------- equipped weapons --------
	EquipItem(self, ItMw_Zweihaender2);

	// -------- daily routine --------
	daily_routine = Rtn_PreStart_705;
};

func void Rtn_PreStart_705()
{
	TA_Stand_ArmsCrossed(08, 00, 23, 00, "OC_TO_MAGE");
	TA_Stand_ArmsCrossed(23, 00, 08, 00, "OC_TO_MAGE");
};

func void Rtn_Start_705()
{
	TA_Stand_ArmsCrossed(08, 00, 23, 00, "OW_DJG_WATCH_STONEHENGE_01");
	TA_Stand_ArmsCrossed(23, 00, 08, 00, "OW_DJG_WATCH_STONEHENGE_01");
};

func void Rtn_Zwischenstop_705()
{
	TA_Stand_ArmsCrossed(08, 00, 23, 00, "OW_PATH_3_13");
	TA_Stand_ArmsCrossed(23, 00, 08, 00, "OW_PATH_3_13");
};

func void Rtn_GotoStonehendgeEntrance_705()
{
	TA_Stand_ArmsCrossed(08, 00, 23, 00, "OW_PATH_3_STONES");
	TA_Stand_ArmsCrossed(23, 00, 08, 00, "OW_PATH_3_STONES");
};

func void Rtn_LeavingOW_705()
{
	TA_Sit_Campfire(08, 00, 23, 00, "OW_CAVALORN_01");
	TA_Sit_Campfire(23, 00, 08, 00, "OW_CAVALORN_01");
};

func void Rtn_Angriff_705()
{
	TA_Stand_ArmsCrossed(08, 00, 23, 00, "OW_UNDEAD_DUNGEON_02");
	TA_Stand_ArmsCrossed(23, 00, 08, 00, "OW_UNDEAD_DUNGEON_02");
};

func void Rtn_RunToEntrance_705()
{
	TA_RunToWP(08, 00, 23, 00, "OW_PATH_3_STONES");
	TA_RunToWP(23, 00, 08, 00, "OW_PATH_3_STONES");
};

func void Rtn_Tot_705()
{
	TA_RunToWP(08, 00, 23, 00, "TOT");
	TA_RunToWP(23, 00, 08, 00, "TOT");
};
