/*

var int Pray_Staff_Mana;

// =====================================

INSTANCE ItMW_GMM_Stab_05_Combat_V0 (C_Item)
{   
    name                =   "Staff of Combat";
    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab05;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab05;       
    
    on_equip            =   Equip_2H_05_GMM;
    on_unequip          =   UnEquip_2H_05_GMM;
    
    cond_atr[2]         =   ATR_STRENGTH;
    cond_value[2]           =   Condition_Stab05_GMM;
    visual                  =   "ItMW_MageStaff_Blades_2H_01.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF5";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Str_needed;              COUNT[1]    = cond_value[2];
    TEXT[4]                 = NAME_ADDON_BONUS_2H;          COUNT[4]    = Waffenbonus_11_GMM;
//  TEXT[4]                 =;
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};



INSTANCE ItMW_GMM_Stab_05_Combat_V1 (C_Item)
{   
    name                =   "Staff of Combat";
    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab05;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab05;       
    
    on_equip            =   Equip_2H_05_GMM;
    on_unequip          =   UnEquip_2H_05_GMM;
    
    cond_atr[2]         =   ATR_STRENGTH;
    cond_value[2]           =   Condition_Stab05_GMM;
    visual                  =   "ItMW_MageStaff_Blades_2H_01.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF5";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Str_needed;              COUNT[1]    = cond_value[2];
    TEXT[4]                 = NAME_ADDON_BONUS_2H;          COUNT[4]    = Waffenbonus_11_GMM;
//  TEXT[4]                 =;
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};

INSTANCE ItMW_GMM_Stab_05_Combat_V2 (C_Item)
{   
    name                =   "Staff of Combat";
    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab05;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab05;       
    
    on_equip            =   Equip_2H_05_GMM;
    on_unequip          =   UnEquip_2H_05_GMM;
    
    cond_atr[2]         =   ATR_STRENGTH;
    cond_value[2]           =   Condition_Stab05_GMM;
    visual                  =   "ItMW_MageStaff_Blades_2H_01.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF5";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Str_needed;              COUNT[1]    = cond_value[2];
    TEXT[4]                 = NAME_ADDON_BONUS_2H;          COUNT[4]    = Waffenbonus_11_GMM;
//  TEXT[4]                 =;
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};

INSTANCE ItMW_GMM_Stab_05_Combat_V3 (C_Item)
{   
    name                =   "Staff of Combat";
    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab05;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab05;       
    
    on_equip            =   Equip_2H_05_GMM;
    on_unequip          =   UnEquip_2H_05_GMM;
    
    cond_atr[2]         =   ATR_STRENGTH;
    cond_value[2]           =   Condition_Stab05_GMM;
    visual                  =   "ItMW_MageStaff_Blades_2H_01.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF5";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Str_needed;              COUNT[1]    = cond_value[2];
    TEXT[4]                 = NAME_ADDON_BONUS_2H;          COUNT[4]    = Waffenbonus_11_GMM;
//  TEXT[4]                 =;
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};


INSTANCE PC_PrayShrine_Bless_Combat_V1 (C_Info)
{
	npc				= PC_Hero;
	nr				= 3;
	condition		= PC_PrayShrine_Bless_Combat_V1_Condition;
	information		= PC_PrayShrine_Bless_Combat_V1_Info;
	permanent		= TRUE;
	description		= GMM_Activate_Wand; 
};


FUNC INT PC_PrayShrine_Bless_Combat_V1_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
//	&& (Npc_GetDistToWP (hero,"NW_MONASTERY_CHAPELL_02") <= 500)   
	&& ((Npc_HasItems (hero,ItMW_GMM_Stab_05_Combat_V0) >= 1))
	{	
		Pray_Staff_Mana = True;
		return TRUE;
	};
};
FUNC VOID PC_PrayShrine_Bless_Combat_V1_Info()
{
	if (ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		PrintScreen	(PRINT_SCIsObsessed, -1,-1,FONT_Screen,2);
		Snd_Play ("DEM_Die");
	}		
	
			if (Npc_HasItems (hero,ItMW_GMM_Stab_05_Combat_V0) >= 1)	
			{	
				Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_05_Combat_V0, 1);
				CreateInvItems 		(hero,ItMW_GMM_Stab_05_Combat_V1, 1);
				Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
				Snd_Play ("MFX_Heal_Cast" );
				B_GivePlayerXP (XP_SwordBlessed);
				print(GMM_Staff_Activated);
			};
			
};


INSTANCE PC_PrayShrine_Bless_Combat_V2 (C_Info)
{
	npc				= PC_Hero;
	nr				= 3;
	condition		= PC_PrayShrine_Bless_Combat_V2_Condition;
	information		= PC_PrayShrine_Bless_Combat_V2_Info;
	permanent		= TRUE;
	description		= GMM_Bless_Wand; 
};

FUNC INT PC_PrayShrine_Bless_Combat_V2_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
//	&& (Npc_GetDistToWP (hero,"NW_MONASTERY_CHAPELL_02") <= 500)   
	&& ((Npc_HasItems (hero,ItMW_GMM_Stab_05_Combat_V1) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID PC_PrayShrine_Bless_Combat_V2_Info()
{
	if (ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		PrintScreen	(PRINT_SCIsObsessed, -1,-1,FONT_Screen,2);
		Snd_Play ("DEM_Die");
	}
	else
		
			
			if (Npc_HasItems (hero,ItMW_GMM_Stab_05_Combat_V1) >= 1)	
			{	
				Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_05_Combat_V1, 1);
				CreateInvItems 		(hero,ItMW_GMM_Stab_05_Combat_V2, 1);
				Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
				Snd_Play ("MFX_Heal_Cast" );
				B_GivePlayerXP (XP_SwordBlessed);
			};
			
};


INSTANCE PC_PrayShrine_Bless_Combat_V3 (C_Info)
{
	npc				= PC_Hero;
	nr				= 3;
	condition		= PC_PrayShrine_Bless_Combat_V3_Condition;
	information		= PC_PrayShrine_Bless_Combat_V3_Info;
	permanent		= TRUE;
	description		= GMM_Bless_Wand; 
};

FUNC INT PC_PrayShrine_Bless_Combat_V3_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE)
//	&& (Npc_GetDistToWP (hero,"NW_MONASTERY_CHAPELL_02") <= 500)   
	&& ((Npc_HasItems (hero,ItMW_GMM_Stab_05_Combat_V2) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID PC_PrayShrine_Bless_Combat_V3_Info()
{
	if (ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		PrintScreen	(PRINT_SCIsObsessed, -1,-1,FONT_Screen,2);
		Snd_Play ("DEM_Die");
	}
	else
		if (Npc_HasItems(hero, ItMi_Gold) >= Gold_BlessWand_01_GMM)
			{
			Npc_RemoveInvItems(hero, ItMi_Gold, Gold_BlessWand_01_GMM);
			concatDonation_GMM = ConcatStrings(IntToString(Gold_BlessWand_01_GMM), PRINT_GoldGegeben);
			AI_PrintScreen(concatDonation_GMM, -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
			
			if (Npc_HasItems (hero,ItMW_GMM_Stab_05_Combat_V2) >= 1)	
		{	
				Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_05_Combat_V2, 1);
				CreateInvItems 		(hero,ItMW_GMM_Stab_05_Combat_V3, 1);
				Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
				Snd_Play ("MFX_Heal_Cast" );
				B_GivePlayerXP (XP_SwordBlessed);
		};
			}
		else
		{
			AI_PrintScreen(PRINT_NotEnoughGold, -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
		};
			
};


*/