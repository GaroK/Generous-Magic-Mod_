instance KDW_1405_Addon_Merdarion_NW(Npc_Default)
{
	// -------- NPC --------
	name							= "Merdarion";
	npctype							= NpcType_Main;
	guild							= GIL_KDW;
	flags							= NPC_FLAG_IMMORTAL;

	voice							= 6;
	id								= 1405;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 5);

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Thief", Face_P_NormalBart_Nefarius, BodyTex_P, ItAr_KdW_L_Addon);
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
	daily_routine = Rtn_PreStart_1405;
};

func void Rtn_PreStart_1405()
{
	TA_Smalltalk(08, 00, 20, 00, "NW_TROLLAREA_PORTAL_03");
	TA_Smalltalk(20, 00, 08, 00, "NW_TROLLAREA_PORTAL_03");
};

func void Rtn_Start_1405()
{
	TA_Stand_ArmsCrossed(06, 05, 06, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(06, 15, 06, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(06, 25, 06, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(06, 35, 06, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(06, 45, 06, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(06, 55, 07, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(07, 05, 07, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(07, 15, 07, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(07, 25, 07, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(07, 35, 07, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(07, 45, 07, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(07, 55, 08, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(08, 05, 08, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(08, 15, 08, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(08, 25, 08, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(08, 35, 08, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(08, 45, 08, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(08, 55, 09, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(09, 05, 09, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(09, 15, 09, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(09, 25, 09, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(09, 35, 09, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(09, 45, 09, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(09, 55, 10, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(10, 05, 10, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(10, 15, 10, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(10, 25, 10, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(10, 35, 10, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(10, 45, 10, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(10, 55, 11, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(11, 05, 11, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(11, 15, 11, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(11, 25, 11, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(11, 35, 11, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(11, 45, 11, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(11, 55, 12, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(12, 05, 12, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(12, 15, 12, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(12, 25, 12, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(12, 35, 12, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(12, 45, 12, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(12, 55, 13, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(13, 05, 13, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(13, 15, 13, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(13, 25, 13, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(13, 35, 13, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(13, 45, 13, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(13, 55, 14, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(14, 05, 14, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(14, 15, 14, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(14, 25, 14, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(14, 35, 14, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(14, 45, 14, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(14, 55, 15, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(15, 05, 15, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(15, 15, 15, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(15, 25, 15, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(15, 35, 15, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(15, 45, 15, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(15, 55, 16, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(16, 05, 16, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(16, 15, 16, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(16, 25, 16, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(16, 35, 16, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(16, 45, 16, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(16, 55, 17, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(17, 05, 17, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(17, 15, 17, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(17, 25, 17, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(17, 35, 17, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(17, 45, 17, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(17, 55, 18, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(18, 05, 18, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(18, 15, 18, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(18, 25, 18, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(18, 35, 18, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(18, 45, 18, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(18, 55, 19, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(19, 05, 19, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(19, 15, 19, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(19, 25, 19, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(19, 35, 19, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(19, 45, 19, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(19, 55, 20, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(20, 05, 20, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(20, 15, 20, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(20, 25, 20, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(20, 35, 20, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(20, 45, 20, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(20, 55, 21, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(21, 05, 21, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(21, 15, 21, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(21, 25, 21, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(21, 35, 21, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(21, 45, 21, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(21, 55, 22, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(22, 05, 22, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(22, 15, 22, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(22, 25, 22, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(22, 35, 22, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(22, 45, 22, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(22, 55, 23, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(23, 05, 23, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(23, 15, 23, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(23, 25, 23, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(23, 35, 23, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(23, 45, 23, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(23, 55, 00, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(00, 05, 00, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(00, 15, 00, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(00, 25, 00, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(00, 35, 00, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(00, 45, 00, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(00, 55, 01, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(01, 05, 01, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(01, 15, 01, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(01, 25, 01, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(01, 35, 01, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(01, 45, 01, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(01, 55, 02, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(02, 05, 02, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(02, 15, 02, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(02, 25, 02, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(02, 35, 02, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(02, 45, 02, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(02, 55, 03, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(03, 05, 03, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(03, 15, 03, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(03, 25, 03, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(03, 35, 03, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(03, 45, 03, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(03, 55, 04, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(04, 05, 04, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(04, 15, 04, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(04, 25, 04, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(04, 35, 04, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(04, 45, 04, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(04, 55, 05, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");

	TA_Stand_ArmsCrossed(05, 05, 05, 15, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(05, 15, 05, 25, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(05, 25, 05, 35, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(05, 35, 05, 45, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
	TA_Stand_ArmsCrossed(05, 45, 05, 55, "NW_TROLLAREA_PORTAL_02");
	TA_Stand_ArmsCrossed(05, 55, 06, 05, "NW_TROLLAREA_PORTALTEMPEL_STUDY_05");
};

func void Rtn_Ringritual_1405()
{
	TA_Circle(08, 00, 20, 00, "NW_TROLLAREA_PORTALTEMPEL_RITUAL_06");
	TA_Circle(20, 00, 08, 00, "NW_TROLLAREA_PORTALTEMPEL_RITUAL_06");
};

func void Rtn_PreRingritual_1405()
{
	TA_Study_WP(08, 00, 20, 00, "NW_TROLLAREA_PORTALTEMPEL_RITUAL_06");
	TA_Study_WP(20, 00, 08, 00, "NW_TROLLAREA_PORTALTEMPEL_RITUAL_06");
};

func void Rtn_OpenPortal_1405()
{
	TA_Study_WP(08, 00, 20, 00, "NW_TROLLAREA_PORTAL_KDWWAIT_06");
	TA_Study_WP(20, 00, 08, 00, "NW_TROLLAREA_PORTAL_KDWWAIT_06");
};

func void Rtn_TOT_1405()
{
	TA_Sleep(08, 00, 20, 00, "TOT");
	TA_Sleep(20, 00, 08, 00, "TOT");
};
