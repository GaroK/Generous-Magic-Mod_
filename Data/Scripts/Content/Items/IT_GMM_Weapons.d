


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
};

// *****************************************************



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
*/

