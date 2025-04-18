instance KDW_14040_Addon_Riordian_ADW(Npc_Default)
{
	// -------- NPC --------
	name							= "Riordian";
	npctype							= NpcType_Main;
	guild							= GIL_KDW;
	flags							= NPC_FLAG_IMMORTAL;

	voice							= 10;
	id								= 14040;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 5);

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Bald", Face_P_NormalBart_Riordian, BodyTex_P, ItAr_KdW_L_Addon);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMDS(self, "Humans_Mage.mds");

	// -------- aivars --------
	aivar[AIV_MagicUser]			= MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild]		= TRUE;
	aivar[AIV_IgnoresArmor]			= TRUE;

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_STRONG;

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 80);

	// -------- inventory --------
	B_CreateAmbientInv(self);

	// -------- daily routine --------
	daily_routine = Rtn_Start_14040;
};

func void Rtn_Start_14040()
{
	TA_Study_WP(07, 05, 07, 20, "ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(07, 20, 08, 25, "ADW_ENTRANCE_PLATEAU_10A");
	TA_Study_WP(08, 25, 09, 05, "ADW_ENTRANCE_PLATEAU_14A");
	TA_Study_WP(09, 05, 10, 45, "ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(10, 45, 11, 55, "ADW_ENTRANCE_PLATEAU_14A");
	TA_Study_WP(11, 55, 12, 05, "ADW_ENTRANCE_PLATEAU_10A");

	TA_Study_WP(12, 05, 13, 20, "ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(13, 20, 14, 25, "ADW_ENTRANCE_PLATEAU_14A");
	TA_Study_WP(14, 25, 15, 05, "ADW_ENTRANCE_PLATEAU_10A");
	TA_Study_WP(15, 05, 16, 45, "ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(16, 45, 17, 55, "ADW_ENTRANCE_PLATEAU_14A");
	TA_Study_WP(17, 55, 18, 05, "ADW_ENTRANCE_PLATEAU_10A");

	TA_Study_WP(18, 05, 19, 20, "ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(19, 20, 20, 25, "ADW_ENTRANCE_PLATEAU_10A");
	TA_Study_WP(20, 25, 21, 05, "ADW_ENTRANCE_PLATEAU_06A");
	TA_Study_WP(21, 05, 22, 00, "ADW_ENTRANCE_PLATEAU_10A");

	TA_Sleep(22, 00, 07, 05, "ADW_ENTRANCE_BUILDING2_05");
};
