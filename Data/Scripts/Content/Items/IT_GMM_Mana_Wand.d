
const string GMM_Name_Mana_Wand		        = "Magic Wand";

var int Pray_Staff_Mana;

// =====================================

INSTANCE ItMW_GMM_Stab_01_Mana_V0 (C_Item)
{   
    name                =   GMM_Name_Mana_Wand;  

    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

//    damageTotal         =   Damage_Stab_GMM_01;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab02;       
    
    on_equip            =   Equip_Inactive_Staff;
 //   on_unequip          =   UnEquip_Zauberstab;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Good_2H_01.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF2";

    description             =   name;

//    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]             =
    TEXT[3]             = "Ulthar enchanted this wand.";
    TEXT[4]                 = NAME_Bonus_Mana;              COUNT[4]    = 50;//FIXME_FILLER

    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};



INSTANCE ItMW_GMM_Stab_01_Mana_V1 (C_Item)
{   
    name                =   GMM_Name_Mana_Wand;  

    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab_GMM_01;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab02;       
    
    on_equip            =   Equip_Zauberstab_V1;
    on_unequip          =   UnEquip_Zauberstab_V1;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Good_2H_01.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF2";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]             =
    TEXT[3]             = "Ulthar enchanted this wand.";
    TEXT[4]                 = NAME_Bonus_Mana;              COUNT[4]    = 50;//FIXME_FILLER

    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};
FUNC VOID Equip_Zauberstab_V1()
{
    if Npc_IsPlayer (self)
    { 
        Npc_ChangeAttribute (self, ATR_MANA_MAX,50);
//  Npc_ChangeAttribute (self, ATR_MANA,40); //GMM - Very exploitable
    };
};
FUNC VOID UnEquip_Zauberstab_V1()
{
    if Npc_IsPlayer (self)
    { 
        Npc_ChangeAttribute (self, ATR_MANA_MAX, - 50);
        
        if self.attribute [ATR_MANA]    >= 50
        {
            Npc_ChangeAttribute (self, ATR_MANA, - 50);
        }
        else
        {
            self.attribute[ATR_MANA] = 0;
        };
    };
    
    
};

INSTANCE ItMW_GMM_Stab_01_Mana_V2 (C_Item)
{   
    name                =   GMM_Name_Mana_Wand;  

    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab_GMM_02;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab02;       
    
    on_equip            =   Equip_Zauberstab_V2;
    on_unequip          =   UnEquip_Zauberstab_V2;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Good_2H_02.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF2";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]             =
    TEXT[3]             = "Ulthar enchanted this wand.";
    TEXT[4]                 = NAME_Bonus_Mana;              COUNT[4]    = 100;//FIXME_FILLER

    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};
FUNC VOID Equip_Zauberstab_V2()
{
    if Npc_IsPlayer (self)
    { 
        Npc_ChangeAttribute (self, ATR_MANA_MAX,100);
//  Npc_ChangeAttribute (self, ATR_MANA,40); //GMM - Very exploitable
    };
};
FUNC VOID UnEquip_Zauberstab_V2()
{
    if Npc_IsPlayer (self)
    { 
        Npc_ChangeAttribute (self, ATR_MANA_MAX, - 100);
        
        if self.attribute [ATR_MANA]    >= 100
        {
            Npc_ChangeAttribute (self, ATR_MANA, - 100);
        }
        else
        {
            self.attribute[ATR_MANA] = 0;
        };
    };
    
    
};

INSTANCE ItMW_GMM_Stab_01_Mana_V3 (C_Item)
{   
    name                =   GMM_Name_Mana_Wand;  

    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab_GMM_03;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab02;       
    
    on_equip            =   Equip_Zauberstab_V3;
    on_unequip          =   UnEquip_Zauberstab_V3;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Good_2H_03.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF2";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]             =
    TEXT[3]             = "Ulthar enchanted this wand.";
    TEXT[4]                 = NAME_Bonus_Mana;              COUNT[4]    = 150;//FIXME_FILLER

    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};
FUNC VOID Equip_Zauberstab_V3()
{
    if Npc_IsPlayer (self)
    { 
        Npc_ChangeAttribute (self, ATR_MANA_MAX,150);
//  Npc_ChangeAttribute (self, ATR_MANA,40); //GMM - Very exploitable
    };
};
FUNC VOID UnEquip_Zauberstab_V3()
{
    if Npc_IsPlayer (self)
    { 
        Npc_ChangeAttribute (self, ATR_MANA_MAX, - 150);
        
        if self.attribute [ATR_MANA]    >= 150
        {
            Npc_ChangeAttribute (self, ATR_MANA, - 150);
        }
        else
        {
            self.attribute[ATR_MANA] = 0;
        };
    };
    
    
};


//test ##############################################################################################################################
instance  PC_PrayShrine_Activate_Staff(C_INFO)
{
	npc				= PC_Hero;
	nr				= 3;
	condition		= PC_PrayShrine_Activate_Staff_Condition;
	information		= PC_PrayShrine_Activate_Staff_Info;
	permanent		= TRUE;
	description		= GMM_Activate_Wand;
};

func int PC_PrayShrine_Activate_Staff_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYSHRINE)
	{
		if(Npc_HasItems(hero,ItMW_GMM_Stab_01_Mana_V0))
		{
			return TRUE;
		};
		if(Npc_HasItems(hero,ItMW_GMM_Stab_02_Regen_V0))
		{
			return TRUE;
		};
		if(Npc_HasItems(hero,ItMW_GMM_Stab_03_Eff_V0))
		{
			return TRUE;
		};
		if(Npc_HasItems(hero,ItMW_GMM_Stab_04_Summon_V0))
		{
			return TRUE;
		};
	};
};
func void PC_PrayShrine_Activate_Staff_Info()
{
	Info_AddChoice( PC_PrayShrine_Activate_Staff, DIALOG_BACK,  PC_PrayShrine_Activate_Staff_BACK);
    if Npc_HasItems(hero, ItMW_GMM_Stab_01_Mana_V0) >= 1
	{
        Info_AddChoice( PC_PrayShrine_Activate_Staff, GMM_Name_Mana_Wand, PC_PrayShrine_Bless_Mana_V1_Info);
    };
    if Npc_HasItems(hero, ItMW_GMM_Stab_02_Regen_V0) >= 1 {
        Info_AddChoice( PC_PrayShrine_Activate_Staff, GMM_Name_Regen_Wand, PC_PrayShrine_Bless_Regen_V1_Info);
    };
    if Npc_HasItems(hero, ItMW_GMM_Stab_03_Eff_V0) >= 1 {
        Info_AddChoice( PC_PrayShrine_Activate_Staff, GMM_Name_Efficiency_Wand, PC_PrayShrine_Bless_Efficiency_V1_Info);
    };
    if Npc_HasItems(hero, ItMW_GMM_Stab_04_Summon_V0) >= 1 {
        Info_AddChoice( PC_PrayShrine_Activate_Staff, GMM_Name_Summon_Wand, PC_PrayShrine_Bless_Summon_V1_Info);
    };
	
};

func void  PC_PrayShrine_Activate_Staff_BACK()
{
	Info_ClearChoices(PC_PrayShrine_Activate_Staff);
};


//test ##############################################################################################################################






instance  PC_PrayShrine_Bless_Staff(C_INFO)
{
	npc				= PC_Hero;
	nr				= 3;
	condition		= PC_PrayShrine_Bless_Staff_Condition;
	information		= PC_PrayShrine_Bless_Staff_Info;
	permanent		= TRUE;
	description		= GMM_Bless_Wand;
};


func int PC_PrayShrine_Bless_Staff_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYSHRINE)
	{
		if(Npc_HasItems(hero,ItMW_GMM_Stab_01_Mana_V1))
		{
			return TRUE;
		};
		if(Npc_HasItems(hero,ItMW_GMM_Stab_02_Regen_V1))
		{
			return TRUE;
		};
		if(Npc_HasItems(hero,ItMW_GMM_Stab_03_Eff_V1))
		{
			return TRUE;
		};
		if(Npc_HasItems(hero,ItMW_GMM_Stab_04_Summon_V1))
		{
			return TRUE;
		};
		
		
		
		if(Npc_HasItems(hero,ItMW_GMM_Stab_01_Mana_V2))
		{
			return TRUE;
		};
		if(Npc_HasItems(hero,ItMW_GMM_Stab_02_Regen_V2))
		{
			return TRUE;
		};
		if(Npc_HasItems(hero,ItMW_GMM_Stab_03_Eff_V2))
		{
			return TRUE;
		};
		if(Npc_HasItems(hero,ItMW_GMM_Stab_04_Summon_V2))
		{
			return TRUE;
		};
		
	};
};



func void PC_PrayShrine_Bless_Staff_Info()
{
	Info_AddChoice( PC_PrayShrine_Bless_Staff, DIALOG_BACK,  PC_PrayShrine_Bless_Staff_BACK);
    if Npc_HasItems(hero, ItMW_GMM_Stab_01_Mana_V1) >= 1
	{
        Info_AddChoice( PC_PrayShrine_Bless_Staff, GMM_Name_Mana_Wand, PC_PrayShrine_Bless_Mana_V2_Info);
    };
    if Npc_HasItems(hero, ItMW_GMM_Stab_02_Regen_V1) >= 1 {
        Info_AddChoice( PC_PrayShrine_Bless_Staff, GMM_Name_Regen_Wand, PC_PrayShrine_Bless_Regen_V2_Info);
    };
    if Npc_HasItems(hero, ItMW_GMM_Stab_03_Eff_V1) >= 1 {
        Info_AddChoice( PC_PrayShrine_Bless_Staff, GMM_Name_Efficiency_Wand, PC_PrayShrine_Bless_Efficiency_V2_Info);
    };
    if Npc_HasItems(hero, ItMW_GMM_Stab_04_Summon_V1) >= 1 {
        Info_AddChoice( PC_PrayShrine_Bless_Staff, GMM_Name_Summon_Wand, PC_PrayShrine_Bless_Summon_V2_Info);
    };
	
	
    if Npc_HasItems(hero, ItMW_GMM_Stab_01_Mana_V2) >= 1 {
        Info_AddChoice( PC_PrayShrine_Bless_Staff, GMM_Name_Mana_Wand, PC_PrayShrine_Bless_Mana_V3_Info);
    };
    if Npc_HasItems(hero, ItMW_GMM_Stab_02_Regen_V2) >= 1 {
        Info_AddChoice( PC_PrayShrine_Bless_Staff, GMM_Name_Regen_Wand, PC_PrayShrine_Bless_Regen_V3_Info);
    };
    if Npc_HasItems(hero, ItMW_GMM_Stab_03_Eff_V2) >= 1 {
        Info_AddChoice( PC_PrayShrine_Bless_Staff, GMM_Name_Efficiency_Wand, PC_PrayShrine_Bless_Efficiency_V3_Info);
    };
    if Npc_HasItems(hero, ItMW_GMM_Stab_04_Summon_V2) >= 1 {
        Info_AddChoice( PC_PrayShrine_Bless_Staff, GMM_Name_Summon_Wand, PC_PrayShrine_Bless_Summon_V3_Info);
    };
};

func void  PC_PrayShrine_Bless_Staff_BACK()
{
	Info_ClearChoices(PC_PrayShrine_Bless_Staff);
};






FUNC VOID PC_PrayShrine_Bless_Mana_V1_Info()
{
	if (ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		PrintScreen	(PRINT_SCIsObsessed, -1,-1,FONT_Screen,2);
		Snd_Play ("DEM_Die");
	}		
	
			if (Npc_HasItems (hero,ItMW_GMM_Stab_01_Mana_V0) >= 1)	
			{	
				Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_01_Mana_V0, 1);
				CreateInvItems 		(hero,ItMW_GMM_Stab_01_Mana_V1, 1);
				Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
				Snd_Play ("MFX_Heal_Cast" );
				B_GivePlayerXP (XP_SwordBlessed);
				print(GMM_Staff_Activated);
				Pray_Staff_Mana = True;
			};
			
};



FUNC VOID PC_PrayShrine_Bless_Mana_V2_Info()
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
            
            if (Npc_HasItems (hero,ItMW_GMM_Stab_01_Mana_V1) >= 1)    
            {    
                Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_01_Mana_V1, 1);
                CreateInvItems         (hero,ItMW_GMM_Stab_01_Mana_V2, 1);
                Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
                Snd_Play ("MFX_Heal_Cast" );
                B_GivePlayerXP (XP_SwordBlessed);
            };

            //other items here.......
        };
    };
};


FUNC VOID PC_PrayShrine_Bless_Mana_V3_Info()
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
            
            if (Npc_HasItems (hero,ItMW_GMM_Stab_01_Mana_V2) >= 1)    
            {    
                Npc_RemoveInvItems  (hero,ItMW_GMM_Stab_01_Mana_V2, 1);
                CreateInvItems         (hero,ItMW_GMM_Stab_01_Mana_V3, 1);
                Wld_PlayEffect("spellFX_PalHeal_ORIGIN",  hero, hero, 0, 0, 0, FALSE );
                Snd_Play ("MFX_Heal_Cast" );
                B_GivePlayerXP (XP_SwordBlessed);
            };

            //other items here.......
        };
    };
};


