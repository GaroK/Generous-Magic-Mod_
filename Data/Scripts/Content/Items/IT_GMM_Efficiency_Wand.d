

const string GMM_Name_Efficiency_Wand		        = "Wand of Efficiency";
const string GMM_Desc_Efficiency_Wand_V1 = "Spells cost 35% mana less to cast.";
const string GMM_Desc_Efficiency_Wand_V2 = "Spells cost 40% mana less to cast.";
const string GMM_Desc_Efficiency_Wand_V3 = "Spells cost 45% mana less to cast.";


const string GMM_Bless_Wand							= "Improve Staff (1000 Gold)";
const string GMM_Staff_Activated					= "Staff is now active!";
const string GMM_Staff_Inactive						= "Staff inactive";
const string GMM_Staff_Inactive_PrayFirst			= "I need to pray first!";
const string GMM_Activate_Wand						= "Activate Staff";

const int Gold_BlessWand_01_GMM					= 1000;		
const int Gold_BlessWand_02_GMM					= 2000;		
const int Gold_BlessWand_03_GMM					= 3000;	

var string concatDonation_GMM;
Var int Pray_Staff_Efficiency;

func void Equip_Inactive_Staff()
{
    if(Npc_IsPlayer(self))
    {
        if(Pray_Staff_Efficiency == FALSE)
		||(Pray_Staff_Regen == FALSE)
		||(Pray_Staff_Mana == FALSE) 
		||(Pray_Staff_Summon == FALSE)
		
        {
            PrintScreen(GMM_Staff_Inactive,-1,9,Font_Screen,5);
			PrintScreen(GMM_Staff_Inactive_PrayFirst,-1,16,Font_Screen,5);
            AI_RemoveWeapon(hero);
            AI_UnequipWeapons(hero);
            return;
        };
    };
};

FUNC VOID Equip_Staff_Inactive()
{
	if Npc_IsPlayer (self)
	{ 
		print(GMM_Staff_Activated);
	};
};

INSTANCE ItMW_GMM_Stab_03_Eff_V0 (C_Item)
{   
    name                =   GMM_Name_Efficiency_Wand;
    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab05;
    damagetype          =   DAM_BLUNT;
    range               =   RANGE_Stab05;       
    
	on_equip            =   Equip_Inactive_Staff;
//  on_unequip          =   UnEquip_2H_05;
    
    cond_atr[2]         =   ATR_MANA_MAX;
	cond_value[2]	    =   0;
    visual              =   "ItMW_MageStaff_Normal_2H_01.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF5";

    description         =   name;

    TEXT[0]             = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Mana_needed;             COUNT[1]    = cond_value[2];
//  TEXT[2]             = NAME_ADDON_BONUS_2H;          COUNT[2]    = Waffenbonus_05;
    TEXT[4]             = GMM_Desc_Efficiency_Wand_V1;
    TEXT[5]             = NAME_Value;                   COUNT[5]    = value;
    
};

INSTANCE ItMW_GMM_Stab_03_Eff_V1 (C_Item)
{   
    name                =   GMM_Name_Efficiency_Wand;
    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab05;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab05;       
    
//  on_equip            =   Equip_2H_05;
//  on_unequip          =   UnEquip_2H_05;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Normal_2H_01.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF5";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]                 = NAME_ADDON_BONUS_2H;          COUNT[2]    = Waffenbonus_05;
    TEXT[4]                 = GMM_Desc_Efficiency_Wand_V1;
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
    
};

INSTANCE ItMW_GMM_Stab_03_Eff_V2 (C_Item)
{   
    name                =   GMM_Name_Efficiency_Wand;
    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab05;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab05;       
    
//  on_equip            =   Equip_2H_05;
//  on_unequip          =   UnEquip_2H_05;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Normal_2H_02.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF5";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]                 = NAME_ADDON_BONUS_2H;          COUNT[2]    = Waffenbonus_05;
    TEXT[4]                 = GMM_Desc_Efficiency_Wand_V2;
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
    
};

INSTANCE ItMW_GMM_Stab_03_Eff_V3 (C_Item)
{   
    name                =   GMM_Name_Efficiency_Wand;
    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab05;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab05;       
    
//  on_equip            =   Equip_2H_05;
//  on_unequip          =   UnEquip_2H_05;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Normal_2H_03.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF5";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]                 = NAME_ADDON_BONUS_2H;          COUNT[2]    = Waffenbonus_05;
    TEXT[4]                 = GMM_Desc_Efficiency_Wand_V3;
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
    
};






FUNC VOID PC_PrayShrine_Bless_Efficiency_V1_Info()
{
	if (ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		PrintScreen	(PRINT_SCIsObsessed, -1,-1,FONT_Screen,2);
		Snd_Play ("DEM_Die");
	}		
	
			if (Npc_HasItems (hero,ItMW_GMM_Stab_03_Eff_V0) >= 1)	
			{	
				Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_03_Eff_V0, 1);
				CreateInvItems 		(hero,ItMW_GMM_Stab_03_Eff_V1, 1);
				Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
				Snd_Play ("MFX_Heal_Cast" );
				B_GivePlayerXP (XP_SwordBlessed);
				print(GMM_Staff_Activated);
				Pray_Staff_Efficiency = True;
			};
			
};



FUNC VOID PC_PrayShrine_Bless_Efficiency_V2_Info()
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
            
            if (Npc_HasItems (hero,ItMW_GMM_Stab_03_Eff_V1) >= 1)    
            {    
                Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_03_Eff_V1, 1);
                CreateInvItems         (hero,ItMW_GMM_Stab_03_Eff_V2, 1);
                Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
                Snd_Play ("MFX_Heal_Cast" );
                B_GivePlayerXP (XP_SwordBlessed);
            };

            //other items here.......
        };
    };
};



FUNC VOID PC_PrayShrine_Bless_Efficiency_V3_Info()
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
            
            if (Npc_HasItems (hero,ItMW_GMM_Stab_03_Eff_V2) >= 1)    
            {    
                Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_03_Eff_V2, 1);
                CreateInvItems         (hero,ItMW_GMM_Stab_03_Eff_V3, 1);
                Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
                Snd_Play ("MFX_Heal_Cast" );
                B_GivePlayerXP (XP_SwordBlessed);
            };

            //other items here.......
        };
    };
};

