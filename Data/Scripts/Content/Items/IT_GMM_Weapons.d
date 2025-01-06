
// =====================================
//             REGEN CODE
// =====================================
var C_Trigger mana_regen_controller;


// func void INIT_GLOBAL()
// {
//     init_global_old();
//     Hlp_PrintConsole(Str_Format("INIT_GLOBAL hero_name: %s", hero.name));
//     mana_regen_controller = AI_StartTriggerScript("Regen_mana", 1000/TICS_PER_SEC);
//     mana_regen_controller.enabled = true;
//     Hlp_PrintConsole(Str_format("enabled: %b, value: %i", mana_regen_controller.enabled, mana_regen_controller.aivariables[0]));
//     Hlp_PrintConsole(Str_format("num_of_triggers: %i", AI_GetTriggersNum));
// };

const int MANA_PER_SEC_5 = 2;
const int MANA_PER_SEC_10 = 7;
const int TICS_PER_SEC = 1;
var int manastaffone;
func int Regen_mana()
{
    if manastaffone
    {
        Npc_ChangeAttribute(hero, atr_mana, MANA_PER_SEC_5);
        return LOOP_CONTINUE;
    };
    return LOOP_END;
};

// =====================================

INSTANCE ItMW_GMM_Stab_02_Regen (C_Item)
{   
    name          =   "Wand of Rejuvenation";  

    mainflag      =   ITEM_KAT_NF;
    flags         =   ITEM_2HD_AXE;
    material      =   MAT_WOOD;

    value         =   Value_Stab04;

    damageTotal   =   Damage_Stab04;
    damagetype    =   DAM_BLUNT;
    range         =   RANGE_Stab04;       
    
    on_equip      =   Equip_Regen_Wand;
    on_unequip    =   UnEquip_Regen_Wand;
    
    cond_atr[2]   =   ATR_MANA_MAX;
    cond_value[2] =   Condition_Stab04;
    visual        =   "ItMW_MageStaff_Good_2H_02.3DS";
    effect        =   "SPELLFX_MAGESTAFF4";

    description   =   name;

    TEXT [0]      = NAME_Damage;                    COUNT[0]    = damageTotal;
    TEXT [1]      = NAME_MANA_needed;               COUNT[1]    = cond_value[2];
    TEXT [4]      = "Mana regeneration per second:";
    COUNT[4]      = MANA_PER_SEC_5;


//  TEXT [4]       =   NAME_ADDON_BONUS_2H;          COUNT[4]    = Waffenbonus_04;
    TEXT [5]       =   NAME_Value;                   COUNT[5]    = value;
};

func void Equip_Regen_Wand()
{
    if (self.id == hero.id)
    {
        self.attribute[ATR_MANA_MAX] += 10;
        manastaffone = true;
        mana_regen_controller = AI_StartTriggerScript("Regen_mana", 1000);
    };
};

func void UnEquip_Regen_Wand() 
{ 
    if (self.id == hero.id)
    {
    self.attribute[ATR_MANA_MAX] -= 10;
    manastaffone = false;
    
    };
};




/*//Garok
INSTANCE ItMW_GMM_Stab_02_Regen_Blessed (C_Item)
{   
    name          =   "Wand of Rejuvenation";  

    mainflag      =   ITEM_KAT_NF;
    flags         =   ITEM_2HD_AXE;
    material      =   MAT_WOOD;

    value         =   123;//Value_Stab_GMM;

    damageTotal   =   Damage_Stab04;
    damagetype    =   DAM_BLUNT;
    range         =   RANGE_Stab04;       
    
    on_equip      =   Equip_Regen_Wand_Blessed_01;
    on_unequip    =   UnEquip_Regen_Wand_Blessed_01;
    
    cond_atr[2]   =   ATR_MANA_MAX;
    cond_value[2] =   5; //Condition_Stab04_GMM;
    visual        =   "ItMW_MageStaff_Good_2H_02.3DS"; 
    effect        =   "SPELLFX_MAGESTAFF4";

    description   =   "Wand of Rejuvenation";


    TEXT[0] = "Mana regeneration per second:";
    COUNT[0] = MANA_PER_SEC_10;    
    TEXT[1]       = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[2]       = NAME_Str_needed;              COUNT[1]    = cond_value[2];
//  TEXT[2]       = NAME_ADDON_BONUS_2H;          COUNT[2]    = Waffenbonus_04;
    TEXT[3]       = "Regenerates 10 mana per second.";
    TEXT[4]       = NAME_Value;                   COUNT[5]    = value;
};

func void Equip_Regen_Wand_Blessed_01()
{
    // self.attribute[ATR_MANA_MAX] += 10;
          if (Npc_IsPlayer(self)) {
    Manaregen_on(MANA_PER_SEC_10);
    };
};

func void UnEquip_Regen_Wand_Blessed_01()
{
    // self.attribute[ATR_MANA_MAX] -= 10;
          if (Npc_IsPlayer(self)) {
    Manaregen_off(MANA_PER_SEC_10);
    };
};


/*instance PC_Hero(C_NPC) {
    PC_Hero_old();
    CreateInvItem(self, ItMW_Addon_Stab05);     
    CreateInvItem(self, ItMW_GMM_Stab_02_Regen_Blessed);
};*/

INSTANCE ItMW_GMM_Stab_03_Eff (C_Item)
{   
    name                =   "Wand of Efficiency";
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
    visual                  =   "ItMW_MageStaff_Blades_2H_01.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF5";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]                 = NAME_ADDON_BONUS_2H;          COUNT[2]    = Waffenbonus_05;
    TEXT[4]                 = "Spells cost 35% mana less to cast.";
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
    
};

// *****************************************************


INSTANCE ItMW_GMM_Stab_04_Summon (C_Item)
{   
    name                =   "Summoner's Wand";  

    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab04;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab04;       
    
    on_equip            =   GMM_Equip_2H_04;
    on_unequip          =   GMM_UnEquip_2H_04;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Good_2H_02.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF4";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]                 = NAME_ADDON_BONUS_2H;          COUNT[2]    = Waffenbonus_04;
    TEXT[3]                 = "Infinite summon time duration.";
    TEXT[4]                 = "";
    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};

INSTANCE ItMW_GMM_Stab_05_Combat (C_Item)
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


// *****************************************************
INSTANCE ItMW_GMM_Stab_01_Mana (C_Item)
{   
    name                =   "Magic Wand";  

    mainflag            =   ITEM_KAT_NF;
    flags               =   ITEM_2HD_AXE;
    material            =   MAT_WOOD;

    value               =   Value_Stab_GMM;

    damageTotal         =   Damage_Stab02;
    damagetype              =   DAM_BLUNT;
    range               =       RANGE_Stab02;       
    
    on_equip            =   Equip_Zauberstab;
    on_unequip          =   UnEquip_Zauberstab;
    
    cond_atr[2]         =   ATR_MANA_MAX;
    cond_value[2]           =   Condition_Stab04_GMM;
    visual                  =   "ItMW_MageStaff_Good_2H_02.3DS"; 
    effect              =   "SPELLFX_MAGESTAFF2";

    description             =   name;

    TEXT[0]                 = NAME_Damage;                  COUNT[0]    = damageTotal;
    
    TEXT[1]             = NAME_Mana_needed;                 COUNT[1]    = cond_value[2];
//  TEXT[2]             =
    TEXT[3]             = "Ulthar enchanted this wand.";
    TEXT[4]                 = NAME_Bonus_Mana;              COUNT[4]    = 40;//FIXME_FILLER

    TEXT[5]                 = NAME_Value;                   COUNT[5]    = value;
};
FUNC VOID Equip_Zauberstab()
{
    if Npc_IsPlayer (self)
    { 
        Npc_ChangeAttribute (self, ATR_MANA_MAX,40);
//  Npc_ChangeAttribute (self, ATR_MANA,40); //GMM - Very exploitable
    };
};
FUNC VOID UnEquip_Zauberstab()
{
    if Npc_IsPlayer (self)
    { 
        Npc_ChangeAttribute (self, ATR_MANA_MAX, - 40);
        
        if self.attribute [ATR_MANA]    >= 40
        {
            Npc_ChangeAttribute (self, ATR_MANA, - 40);
        }
        else
        {
            self.attribute[ATR_MANA] = 0;
        };
    };
    
    
};

