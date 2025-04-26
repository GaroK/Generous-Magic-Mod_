

var C_Trigger mana_regen_controller;


// =====================================
//             REGEN CODE
// =====================================


// func void INIT_GLOBAL()
// {
//     init_global_old();
//     Hlp_PrintConsole(Str_Format("INIT_GLOBAL hero_name: %s", hero.name));
//     mana_regen_controller = AI_StartTriggerScript("Regen_mana", 1000/TICS_PER_SEC);
//     mana_regen_controller.enabled = true;
//     Hlp_PrintConsole(Str_format("enabled: %b, value: %i", mana_regen_controller.enabled, mana_regen_controller.aivariables[0]));
//     Hlp_PrintConsole(Str_format("num_of_triggers: %i", AI_GetTriggersNum));
// };


const string GMM_Name_Regen_Wand 	= "Wand of Rejuvenation";
const string GMM_MagicCircleLow		= "Magic Circle too low.";
// const string GMM_Desc_Regen_Wand = "Mana regeneration per second:";




const int MANA_PER_SEC_2 = 1;
const int MANA_PER_SEC_4 = 2;
const int MANA_PER_SEC_6 = 4;
const int TICS_PER_SEC = 1;
var int Pray_Staff_Regen;
var int regenstaffone;
var int regenstafftwo;
var int regenstaffthree;
func int Regen_mana()
{
    if regenstaffone
    {
        Npc_ChangeAttribute(hero, atr_mana, MANA_PER_SEC_2);
        return LOOP_CONTINUE;
    }
    else if regenstafftwo
    {
        Npc_ChangeAttribute(hero, atr_mana, MANA_PER_SEC_4);
        return LOOP_CONTINUE;
    }
    else if regenstaffthree
    {
        Npc_ChangeAttribute(hero, atr_mana, MANA_PER_SEC_6);
        return LOOP_CONTINUE;
    };
    return LOOP_END;
};


// =====================================

INSTANCE ItMW_GMM_Stab_02_Regen_V0 (C_Item)
{   
    name          =   GMM_Name_Regen_Wand;  

    mainflag      =   ITEM_KAT_NF;
    flags         =   ITEM_2HD_AXE;
    material      =   MAT_WOOD;

    value         =   Value_Stab04;

    damageTotal   =   Damage_Stab04;
    damagetype    =   DAM_BLUNT;
    range         =   RANGE_Stab04;       
    
    on_equip      =   Equip_Inactive_Staff;
//  on_unequip    =   UnEquip_Regen_Wand;
    
   cond_atr[2]   =   ATR_MANA_MAX;
    cond_value[2] =   Condition_Stab04;
    visual        =   "ItMW_MageStaff_Blades_2H_01.3DS";
    effect        =   "SPELLFX_MAGESTAFF4";

    description   =   name;

    TEXT [0]      = NAME_Damage;                    COUNT[0]    = damageTotal;
    TEXT [1]      = NAME_MANA_needed;               COUNT[1]    = cond_value[2];
    TEXT [4]      = GMM_Desc_Regen_Wand;
    COUNT[4]      = MANA_PER_SEC_2;


//  TEXT [4]       =   NAME_ADDON_BONUS_2H;          COUNT[4]    = Waffenbonus_04;
    TEXT [5]       =   NAME_Value;                   COUNT[5]    = value;
};


INSTANCE ItMW_GMM_Stab_02_Regen_V1 (C_Item)
{   
    name          =   GMM_Name_Regen_Wand;  

    mainflag      =   ITEM_KAT_NF;
    flags         =   ITEM_2HD_AXE;
    material      =   MAT_WOOD;

    value         =   Value_Stab04;

    damageTotal   =   Damage_Stab04;
    damagetype    =   DAM_BLUNT;
    range         =   RANGE_Stab04;       
    
    on_equip      =   Equip_Regen_Wand_V1;
    on_unequip    =   UnEquip_Regen_Wand_V1;
    
    cond_atr[2]   =   ATR_MANA_MAX;
    cond_value[2] =   Condition_Stab04;
    visual        =   "ItMW_MageStaff_Blades_2H_01.3DS";
    effect        =   "SPELLFX_MAGESTAFF4";

    description   =   name;

    TEXT [0]      = NAME_Damage;                    COUNT[0]    = damageTotal;
    TEXT [1]      = NAME_MANA_needed;               COUNT[1]    = cond_value[2];
    TEXT [4]      = GMM_Desc_Regen_Wand;
    COUNT[4]      = MANA_PER_SEC_2;


//  TEXT [4]       =   NAME_ADDON_BONUS_2H;          COUNT[4]    = Waffenbonus_04;
    TEXT [5]       =   NAME_Value;                   COUNT[5]    = value;
};

func void Equip_Regen_Wand_V1()
{
    if (self.id == hero.id)
    {
        self.attribute[ATR_MANA_MAX] += 10;
        regenstaffone = true;
        mana_regen_controller = AI_StartTriggerScript("Regen_mana", 1000);
    };
};

func void UnEquip_Regen_Wand_V1() 
{ 
    if (self.id == hero.id)
    {
    self.attribute[ATR_MANA_MAX] -= 10;
    regenstaffone = false;
    
    };
};

INSTANCE ItMW_GMM_Stab_02_Regen_V2 (C_Item)
{   
    name          =   GMM_Name_Regen_Wand;  

    mainflag      =   ITEM_KAT_NF;
    flags         =   ITEM_2HD_AXE;
    material      =   MAT_WOOD;

    value         =   Value_Stab04;

    damageTotal   =   Damage_Stab04;
    damagetype    =   DAM_BLUNT;
    range         =   RANGE_Stab04;       
    
    on_equip      =   Equip_Regen_Wand_V2;
    on_unequip    =   UnEquip_Regen_Wand_V2;
    
    cond_atr[2]   =   ATR_MANA_MAX;
    cond_value[2] =   Condition_Stab04;
    visual        =   "ItMW_MageStaff_Blades_2H_02.3DS";
    effect        =   "SPELLFX_MAGESTAFF4";

    description   =   name;

    TEXT [0]      = NAME_Damage;                    COUNT[0]    = damageTotal;
    TEXT [1]      = NAME_MANA_needed;               COUNT[1]    = cond_value[2];
    TEXT [4]      = GMM_Desc_Regen_Wand;
    COUNT[4]      = MANA_PER_SEC_4;


//  TEXT [4]       =   NAME_ADDON_BONUS_2H;          COUNT[4]    = Waffenbonus_04;
    TEXT [5]       =   NAME_Value;                   COUNT[5]    = value;
};

func void Equip_Regen_Wand_V2()
{
    if (self.id == hero.id)
    {
        self.attribute[ATR_MANA_MAX] += 10;
        regenstafftwo = true;
        mana_regen_controller = AI_StartTriggerScript("Regen_mana", 1000);
    };
};

func void UnEquip_Regen_Wand_V2() 
{ 
    if (self.id == hero.id)
    {
    self.attribute[ATR_MANA_MAX] -= 10;
    regenstafftwo = false;
    
    };
};

INSTANCE ItMW_GMM_Stab_02_Regen_V3 (C_Item)
{   
    name          =   GMM_Name_Regen_Wand; 

    mainflag      =   ITEM_KAT_NF;
    flags         =   ITEM_2HD_AXE;
    material      =   MAT_WOOD;

    value         =   Value_Stab04;

    damageTotal   =   Damage_Stab04;
    damagetype    =   DAM_BLUNT;
    range         =   RANGE_Stab04;       
    
    on_equip      =   Equip_Regen_Wand_V3;
    on_unequip    =   UnEquip_Regen_Wand_V3;
    
    cond_atr[2]   =   ATR_MANA_MAX;
    cond_value[2] =   Condition_Stab04;
    visual        =   "ItMW_MageStaff_Blades_2H_03.3DS";
    effect        =   "SPELLFX_MAGESTAFF4";

    description   =   name;

    TEXT [0]      = NAME_Damage;                    COUNT[0]    = damageTotal;
    TEXT [1]      = NAME_MANA_needed;               COUNT[1]    = cond_value[2];
    TEXT [4]      = GMM_Desc_Regen_Wand;
    COUNT[4]      = MANA_PER_SEC_6;


//  TEXT [4]       =   NAME_ADDON_BONUS_2H;          COUNT[4]    = Waffenbonus_04;
    TEXT [5]       =   NAME_Value;                   COUNT[5]    = value;
};

func void Equip_Regen_Wand_V3()
{
    if (self.id == hero.id)
    {
        self.attribute[ATR_MANA_MAX] += 10;
        regenstaffthree = true;
        mana_regen_controller = AI_StartTriggerScript("Regen_mana", 1000);
    };
};

func void UnEquip_Regen_Wand_V3() 
{ 
    if (self.id == hero.id)
    {
    self.attribute[ATR_MANA_MAX] -= 10;
    regenstaffthree = false;
    
    };
};



FUNC VOID PC_PrayShrine_Bless_Regen_V1_Info()
{
	if (ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		PrintScreen	(PRINT_SCIsObsessed, -1,-1,FONT_Screen,2);
		Snd_Play ("DEM_Die");
	}		
	
			if (Npc_HasItems (hero,ItMW_GMM_Stab_02_Regen_V0) >= 1)	
			{	
				Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_02_Regen_V0, 1);
				CreateInvItems 		(hero,ItMW_GMM_Stab_02_Regen_V1, 1);
				Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
				Snd_Play ("MFX_Heal_Cast" );
				B_GivePlayerXP (XP_SwordBlessed);
				print(GMM_Staff_Activated);
				Pray_Staff_Regen = True;
			};
			
};


FUNC VOID PC_PrayShrine_Bless_Regen_V2_Info()
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
            
            if (Npc_HasItems (hero,ItMW_GMM_Stab_02_Regen_V1) >= 1)    
            {    
                Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_02_Regen_V1, 1);
                CreateInvItems         (hero,ItMW_GMM_Stab_02_Regen_V2, 1);
                Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
                Snd_Play ("MFX_Heal_Cast" );
                B_GivePlayerXP (XP_SwordBlessed);
            };

            //other items here.......
        };
    };
};


FUNC VOID PC_PrayShrine_Bless_Regen_V3_Info()
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
            AI_PrintScreen ("Magic Circle too low.", -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
        }
        else
        {
            Npc_RemoveInvItems(hero, ItMi_Gold, Gold_BlessWand_01_GMM);
            concatDonation_GMM = ConcatStrings(IntToString(Gold_BlessWand_01_GMM), PRINT_GoldGegeben);
            AI_PrintScreen(concatDonation_GMM, -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
            
            if (Npc_HasItems (hero,ItMW_GMM_Stab_02_Regen_V2) >= 1)    
            {    
                Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_02_Regen_V2, 1);
                CreateInvItems         (hero,ItMW_GMM_Stab_02_Regen_V3, 1);
                Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
                Snd_Play ("MFX_Heal_Cast" );
                B_GivePlayerXP (XP_SwordBlessed);
            };

            //other items here.......
        };
    };
};


