/*
Equip Funktionen fÃƒÂ¼r Einhand Waffen
Talent Bonus
*/
// const fÃƒÂ¼r Talentboni stehen in Tuning Melee Weaposn

//----------------------------GMM----------------------------------
var int herohasequippedspecialstaff_v1;

FUNC VOID GMM_Equip_2H_04()
{
	if Npc_IsPlayer (self)
	{ 
	
		GMM_SUMMON_TIME = 180;
		heroHasEquippedSpecialStaff_V1 = true;
	};
};
FUNC VOID GMM_UnEquip_2H_04()
{
	if Npc_IsPlayer (self)
	{ 
		GMM_SUMMON_TIME = 60;
		heroHasEquippedSpecialStaff_V1 = false;
	};
};

/*FUNC VOID Equip_2H_05_GMM()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_11_GMM);
	};
};
FUNC VOID UnEquip_2H_05_GMM()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_11_GMM);
	};
};*/

// ----------------------------1----------------------------------
func void Equip_2H_01()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, Waffenbonus_01);
	};
};

func void UnEquip_2H_01()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, - Waffenbonus_01);
	};
};

// -----------------------------2---------------------------------
func void Equip_2H_02()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, Waffenbonus_02);
	};
};

func void UnEquip_2H_02()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, - Waffenbonus_02);
	};
};

// -----------------------------3---------------------------------
func void Equip_2H_03()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, Waffenbonus_03);
	};
};

func void UnEquip_2H_03()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, - Waffenbonus_03);
	};
};

// ------------------------------4--------------------------------
func void Equip_2H_04()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, Waffenbonus_04);
	};
};

func void UnEquip_2H_04()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, - Waffenbonus_04);
	};
};

// ----------------------------5----------------------------------
func void Equip_2H_05()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, Waffenbonus_05);
	};
};

func void UnEquip_2H_05()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, - Waffenbonus_05);
	};
};

// --------------------------6------------------------------------
func void Equip_2H_06()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, Waffenbonus_06);
	};
};

func void UnEquip_2H_06()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, - Waffenbonus_06);
	};
};

// ---------------------------7-----------------------------------
func void Equip_2H_07()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, Waffenbonus_07);
	};
};

func void UnEquip_2H_07()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, - Waffenbonus_07);
	};
};

// -----------------------------8---------------------------------
func void Equip_2H_08()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, Waffenbonus_08);
	};
};

func void UnEquip_2H_08()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, - Waffenbonus_08);
	};
};

// --------------------------9------------------------------------
func void Equip_2H_09()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, Waffenbonus_09);
	};
};

func void UnEquip_2H_09()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, - Waffenbonus_09);
	};
};

// ----------------------------10----------------------------------
func void Equip_2H_10()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, Waffenbonus_10);
	};
};

func void UnEquip_2H_10()
{
	if (Npc_IsPlayer(self))
	{
		B_AddFightSkill(self, NPC_TALENT_2H, - Waffenbonus_10);
	};
};
