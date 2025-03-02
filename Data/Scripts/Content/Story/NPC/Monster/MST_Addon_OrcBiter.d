/*************************************************************************
** OrcBiter prototype **
*************************************************************************/

prototype Mst_Default_OrcBiter(C_Npc)
{
	// -------- NPC --------
	name							= "Biter";
	guild							= GIL_SCAVENGER;
	level							= 12;

	// -------- attributes --------
	attribute[ATR_STRENGTH]			= 60;
	attribute[ATR_DEXTERITY]		= 60;
	attribute[ATR_HITPOINTS_MAX]	= 120;
	attribute[ATR_HITPOINTS]		= 120;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;

	// -------- protection --------
	protection[PROT_BLUNT]			= 60;
	protection[PROT_EDGE]			= 60;
	protection[PROT_POINT]			= 60;
	protection[PROT_FIRE]			= 60;
	protection[PROT_FLY]			= 60;
	protection[PROT_MAGIC]			= 0;

	// -------- damage --------
	damageType						= DAM_EDGE;
	//	damage[DAM_INDEX_BLUNT]		= 0;
	//	damage[DAM_INDEX_EDGE]		= 0;
	//	damage[DAM_INDEX_POINT]		= 0;
	//	damage[DAM_INDEX_FIRE]		= 0;
	//	damage[DAM_INDEX_FLY]		= 0;
	//	damage[DAM_INDEX_MAGIC]		= 0;

	// -------- visuals --------

	// -------- aivars --------
	aivar[AIV_MM_REAL_ID]			= ID_ORCBITER;
	//	aivar[AIV_MM_Behaviour]		= HUNTER;
	//	aivar[AIV_MM_PercRange]		= 1200;
	//	aivar[AIV_MM_DrohRange]		= 1000;
	//	aivar[AIV_MM_AttackRange]	= 700;
	//	aivar[AIV_MM_DrohTime]		= 5;
	aivar[AIV_MM_FollowTime]		= 10;
	aivar[AIV_MM_FollowInWater]		= TRUE;
	aivar[AIV_MM_RestStart]			= OnlyRoutine;

	// -------- fight tactic --------
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------

	// -------- daily routine --------
	start_aistate = ZS_MM_AllScheduler;
};

// -------------------------------------------------------------
func void Set_OrcBiter_Visuals()
{
	Mdl_SetVisual(self, "Scavenger.mds");
	Mdl_ApplyOverlayMDS(self, "Orcbiter.mds"); // eigener Run-Loop
	//								Body-Mesh Body-Tex Skin-Color Head-MMS Head-Tex Teeth-Tex ARMOR
	Mdl_SetVisualBody(self,	"Sc2_Body",				DEFAULT,DEFAULT,	"",					DEFAULT,	DEFAULT,	-1);
};

/*************************************************************************
** OrcBiter **
*************************************************************************/

instance OrcBiter(Mst_Default_OrcBiter)
{
	// -------- NPC --------

	// -------- attributes --------

	// -------- visuals --------
	Set_OrcBiter_Visuals();

	Npc_SetToFistMode(self);

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------
	CreateInvItems(self, ItFoMuttonRaw, 2);

	// -------- daily routine --------
};
