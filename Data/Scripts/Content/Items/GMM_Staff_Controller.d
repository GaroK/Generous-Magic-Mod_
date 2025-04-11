/*instance  PC_PrayShrine_Activate_Staff(C_INFO)
{
	npc				= PC_Hero;
	nr				= 3;
	condition		= PC_PrayShrine_Activate_Staff_Condition;
	information		= PC_PrayShrine_Activate_Staff_Info;
	permanent		= TRUE;
	description		= GMM_Activate_Wand;
};

func int  PC_PrayShrine_Activate_Staff_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYSHRINE)
	&& ((Npc_HasItems (hero,ItMW_GMM_Stab_01_Mana_V0) >= 1))
	|| ((Npc_HasItems (hero,ItMW_GMM_Stab_02_Regen_V0) >= 1))
	|| ((Npc_HasItems (hero,ItMW_GMM_Stab_03_Eff_V0) >= 1))
	|| ((Npc_HasItems (hero,ItMW_GMM_Stab_04_Summon_V0) >= 1))
	{
		return TRUE;
	};
	
};

func void PC_PrayShrine_Activate_Staff_Info()
{
	Info_ClearChoices( PC_PrayShrine_Activate_Staff);
	Info_AddChoice( PC_PrayShrine_Activate_Staff, DIALOG_BACK,  PC_PrayShrine_Activate_Staff_BACK);
	Info_AddChoice( PC_PrayShrine_Activate_Staff, GMM_Name_Mana_Wand, PC_PrayShrine_Bless_Mana_V1_Info);
	Info_AddChoice( PC_PrayShrine_Activate_Staff, GMM_Name_Regen_Wand, PC_PrayShrine_Bless_Regen_V1_Info);
	Info_AddChoice( PC_PrayShrine_Activate_Staff, GMM_Name_Efficiency_Wand, PC_PrayShrine_Bless_Efficiency_V1_Info);
	Info_AddChoice( PC_PrayShrine_Activate_Staff, GMM_Name_Summon_Wand, PC_PrayShrine_Bless_Summon_V1_Info);
};

func void  PC_PrayShrine_Activate_Staff_BACK()
{
	Info_ClearChoices(PC_PrayShrine_Activate_Staff);
};


instance  PC_PrayShrine_Activate_Staff_Mana(C_INFO)
{
	npc				= PC_Hero;
	nr				= 3;
	condition		= PC_PrayShrine_Activate_Staff_Mana_Condition;
	information		= PC_PrayShrine_Activate_Staff_Mana_Info;
	permanent		= TRUE;
	description		= GMM_Activate_Wand;
};

func int  PC_PrayShrine_Activate_Staff_Mana_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYSHRINE)
	&& ((Npc_HasItems (hero,ItMW_GMM_Stab_01_Mana_V0) >= 1))
	{
		return TRUE;
	};
	
};

func void PC_PrayShrine_Activate_Staff_Info()
{
	Info_ClearChoices( PC_PrayShrine_Activate_Staff_Mana);
	Info_AddChoice( PC_PrayShrine_Activate_Staff, DIALOG_BACK,  PC_PrayShrine_Activate_Staff_BACK);
	Info_AddChoice( PC_PrayShrine_Activate_Staff, GMM_Name_Mana_Wand, PC_PrayShrine_Bless_Mana_V1_Info);
};

func void  PC_PrayShrine_Activate_Staff_Mana_BACK()
{
	Info_ClearChoices(PC_PrayShrine_Activate_Staff);
};*/