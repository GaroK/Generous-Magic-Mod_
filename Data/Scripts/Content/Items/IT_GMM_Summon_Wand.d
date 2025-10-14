const string GMM_Name_Summon_Wand = "Summoner's Wand";
const string GMM_Desc_Summon_Wand = "Extends summon duration to 3 minutes.";
const string GMM_Desc_Summon_Wand_V2 = "Spawns additional Goblin.";
const string GMM_Desc_Summon_Wand_V3 = "Spawns additional creature.";

var int Pray_Staff_Summon;

var int herohasequippedspecialstaff_v2;
var int herohasequippedspecialstaff_v3;

FUNC VOID GMM_Equip_2H_04_V1()
{
	if Npc_IsPlayer (self)
	{ 
	
		GMM_SUMMON_TIME = 180;
		heroHasEquippedSpecialStaff_V1 = true;
		
		if ((Npc_HasItems(self, ItAm_Addon_WispDetector) >= 1))
		{
		Equip_WispDetector();
		};
	};
};
FUNC VOID GMM_UnEquip_2H_04_V1()
{
	if Npc_IsPlayer (self)
	{ 
		GMM_SUMMON_TIME = 60;
		heroHasEquippedSpecialStaff_V1 = false;
		UnEquip_WispDetector();
	};
};

FUNC VOID GMM_Equip_2H_04_V2()
{
	if Npc_IsPlayer (self)
	{ 
	
		GMM_SUMMON_TIME = 180;
		heroHasEquippedSpecialStaff_V2 = true;
		
		if ((Npc_HasItems(self, ItAm_Addon_WispDetector) >= 1))
		{
		Equip_WispDetector();
		};
	};
};
FUNC VOID GMM_UnEquip_2H_04_V2()
{
	if Npc_IsPlayer (self)
	{ 
		GMM_SUMMON_TIME = 60;
		heroHasEquippedSpecialStaff_V2 = false;
		UnEquip_WispDetector();
	};
};

FUNC VOID GMM_Equip_2H_04_V3()
{
	if Npc_IsPlayer (self)
	{ 
	
		GMM_SUMMON_TIME = 180;
		heroHasEquippedSpecialStaff_V3 = true;
		
		if ((Npc_HasItems(self, ItAm_Addon_WispDetector) >= 1))
		{
		Equip_WispDetector();
		};
	};
};
FUNC VOID GMM_UnEquip_2H_04_V3()
{
	if Npc_IsPlayer (self)
	{ 
		GMM_SUMMON_TIME = 60;
		heroHasEquippedSpecialStaff_V3 = false;
		UnEquip_WispDetector();
	};
};

// =====================================

INSTANCE ItMW_GMM_Stab_04_Summon_V0 (C_Item)
{   
    name                =   GMM_Name_Summon_Wand;  

    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab04;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab04;       
    
    on_equip            =   Equip_Inactive_Staff;
 //   on_unequip          =   GMM_UnEquip_2H_04;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Ball_2H_01.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF4";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]                 = NAME_ADDON_BONUS_2H;          COUNT[2]    = Waffenbonus_04;
    TEXT[3]                 = GMM_Desc_Summon_Wand;
    TEXT[4]                 = "";
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};


INSTANCE ItMW_GMM_Stab_04_Summon_V1 (C_Item)
{   
    name                =   GMM_Name_Summon_Wand;  

    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab04;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab04;       
    
    on_equip            =   GMM_Equip_2H_04_V1;
    on_unequip          =   GMM_UnEquip_2H_04_V1;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Ball_2H_01.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF4";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]                 = NAME_ADDON_BONUS_2H;          COUNT[2]    = Waffenbonus_04;
    TEXT[3]                 = GMM_Desc_Summon_Wand;
    TEXT[4]                 = "";
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};


INSTANCE ItMW_GMM_Stab_04_Summon_V2 (C_Item)
{   
    name                =   GMM_Name_Summon_Wand;  

    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab04;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab04;       
    
    on_equip            =   GMM_Equip_2H_04_V2;
    on_unequip          =   GMM_UnEquip_2H_04_V2;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Ball_2H_02.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF4";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]                 = NAME_ADDON_BONUS_2H;          COUNT[2]    = Waffenbonus_04;
    TEXT[3]                 = GMM_Desc_Summon_Wand;
    TEXT[4]                 = GMM_Desc_Summon_Wand_V2;
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};



INSTANCE ItMW_GMM_Stab_04_Summon_V3 (C_Item)
{   
    name                =   GMM_Name_Summon_Wand;  

    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab04;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab04;       
    
    on_equip            =   GMM_Equip_2H_04_V3;
    on_unequip          =   GMM_UnEquip_2H_04_V3;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Ball_2H_03.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF4";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]                 = NAME_ADDON_BONUS_2H;          COUNT[2]    = Waffenbonus_04;
    TEXT[3]                 = GMM_Desc_Summon_Wand;
    TEXT[4]                 = GMM_Desc_Summon_Wand_V3;
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};



FUNC VOID PC_PrayShrine_Bless_Summon_V1_Info()
{
	if (ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		PrintScreen	(PRINT_SCIsObsessed, -1,-1,FONT_Screen,2);
		Snd_Play ("DEM_Die");
	}		
	
			if (Npc_HasItems (hero,ItMW_GMM_Stab_04_Summon_V0) >= 1)	
			{	
				Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_04_Summon_V0, 1);
				CreateInvItems 		(hero,ItMW_GMM_Stab_04_Summon_V1, 1);
				Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
				Snd_Play ("MFX_Heal_Cast" );
				B_GivePlayerXP (XP_SwordBlessed);
				print(GMM_Staff_Activated);
				Pray_Staff_Summon = True;
			};
			
};



FUNC VOID PC_PrayShrine_Bless_Summon_V2_Info()
{
    if (ShrineIsObsessed == TRUE)
    {
        SC_IsObsessed = TRUE;
        PrintScreen    (PRINT_SCIsObsessed, -1,-1,FONT_Screen,2);
        Snd_Play ("DEM_Die");
    }
    else
    {
        if (Npc_HasItems(hero, ItMi_Gold) < Gold_BlessWand_01_GMM)
        {
            AI_PrintScreen(PRINT_NotEnoughGold, -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
        }
        else if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 3)
        {
            AI_PrintScreen (GMM_MagicCircleLow, -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
        }
        else
        {
            Npc_RemoveInvItems(hero, ItMi_Gold, Gold_BlessWand_01_GMM);
            concatDonation_GMM = ConcatStrings(IntToString(Gold_BlessWand_01_GMM), PRINT_GoldGegeben);
            AI_PrintScreen(concatDonation_GMM, -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
            
            if (Npc_HasItems (hero,ItMW_GMM_Stab_04_Summon_V1) >= 1)    
            {    
                Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_04_Summon_V1, 1);
                CreateInvItems         (hero,ItMW_GMM_Stab_04_Summon_V2, 1);
                Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
                Snd_Play ("MFX_Heal_Cast" );
                B_GivePlayerXP (XP_SwordBlessed);
            };

            //other items here.......
        };
    };
};


FUNC VOID PC_PrayShrine_Bless_Summon_V3_Info()
{
    if (ShrineIsObsessed == TRUE)
    {
        SC_IsObsessed = TRUE;
        PrintScreen    (PRINT_SCIsObsessed, -1,-1,FONT_Screen,2);
        Snd_Play ("DEM_Die");
    }
    else
    {
        if (Npc_HasItems(hero, ItMi_Gold) < Gold_BlessWand_01_GMM)
        {
            AI_PrintScreen(PRINT_NotEnoughGold, -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
        }
        else if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 5)
        {
            AI_PrintScreen (GMM_MagicCircleLow, -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
        }
        else
        {
            Npc_RemoveInvItems(hero, ItMi_Gold, Gold_BlessWand_01_GMM);
            concatDonation_GMM = ConcatStrings(IntToString(Gold_BlessWand_01_GMM), PRINT_GoldGegeben);
            AI_PrintScreen(concatDonation_GMM, -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
            
            if (Npc_HasItems (hero,ItMW_GMM_Stab_04_Summon_V2) >= 1)    
            {    
                Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_04_Summon_V2, 1);
                CreateInvItems         (hero,ItMW_GMM_Stab_04_Summon_V3, 1);
                Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
                Snd_Play ("MFX_Heal_Cast" );
                B_GivePlayerXP (XP_SwordBlessed);
            };

            //other items here.......
        };
    };
};


