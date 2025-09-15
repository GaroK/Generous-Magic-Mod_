//As expected, too overpowered.

/*

test(Summoned_Skeleton)
{
    instance Summoned_Skeleton_Immortal(Mst_Default_Skeleton)
    {
        Summoned_Skeleton();
        flags = NPC_FLAG_IMMORTAL;
    };
};

//////////////////////////////
test(Summoned_Wolf)
{
    instance Summoned_Wolf_Immortal(Mst_Default_Wolf)
    {
        Summoned_Wolf();
        flags = NPC_FLAG_IMMORTAL;
    };
};

//////////////////////////////
test(Summoned_Demon)
{
    instance Summoned_Demon_Immortal(Mst_Default_Demon)
    {
        Summoned_Demon();
        flags = NPC_FLAG_IMMORTAL;
    };
};

//////////////////////////////
test(Summoned_Golem)
{
    instance Summoned_Golem_Immortal(Mst_Default_StoneGolem)
    {
        Summoned_Golem();
        flags = NPC_FLAG_IMMORTAL;
    };
};

//////////////////////////////
test(Summoned_Gobbo_Skeleton)
{
    instance Summoned_Gobbo_Skeleton_Immortal(Mst_Default_Gobbo_Skeleton)
    {
        Summoned_Gobbo_Skeleton();
        flags = NPC_FLAG_IMMORTAL;
    };
};


//////////////////////////////
test(Summoned_Guardian)
{
    instance Summoned_Guardian_Immortal(Mst_Addon_Stoneguardian)
    {
        Summoned_Guardian();
        flags = NPC_FLAG_IMMORTAL;
    };
};

//////////////////////////////
test(Summoned_Zombie)
{
    instance Summoned_Zombie_Immortal(Mst_Default_Zombie)
    {
        Summoned_Zombie();
        flags = NPC_FLAG_IMMORTAL;
    };
};
////////////LOL////////////////// 
test(Summoned_Mud)
{
    instance Summoned_Mud_Immortal(Mst_Default_Mud)
    {
        Summoned_Mud();
        flags = NPC_FLAG_IMMORTAL;
    };
};


func int C_NpcIsImmortalSummon(var C_Npc npc)
{
    if(Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(Summoned_Skeleton_Immortal))
    {
        return TRUE;
    };
	
	    if(Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(Summoned_Gobbo_Skeleton_Immortal))
    {
        return TRUE;
    };
	
	    if(Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(Summoned_Demon_Immortal))
    {
        return TRUE;
    };
	
	    if(Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(Summoned_Wolf_Immortal))
    {
        return TRUE;
    };
	
	    if(Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(Summoned_Golem_Immortal))
    {
        return TRUE;
    };
	
	    if(Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(Summoned_Guardian_Immortal))
    {
        return TRUE;
    };
		    if(Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(Summoned_Mud_Immortal))
    {
        return TRUE;
    };
    return FALSE;
};
func int C_HeroCanSummonImmortal()
{
    var C_Item weapon;
    if(Npc_HasEquippedMeleeWeapon(hero) || Npc_HasReadiedMeleeWeapon(hero))
    {
        if(Npc_HasEquippedMeleeWeapon(hero))
        {
            weapon = Npc_GetEquippedMeleeWeapon(hero);
        }
        else if(Npc_HasReadiedMeleeWeapon(hero))
        {
            weapon = Npc_GetReadiedWeapon(hero);
        };
        if(Hlp_IsValidItem(weapon))
        {
            if(Hlp_IsItem(weapon,ItMW_GMM_Stab_04_Summon)) //your weapon here
            {
                return TRUE;
            };
        };
    };
    return FALSE;
};
func void B_KillImmortalSummon(var C_Npc npc)
{
    if(!C_HeroCanSummonImmortal())
    {
        if(C_NpcIsImmortalSummon(npc))
        {
            npc.flags = 0;
            Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
        };
    };
};
func void Spell_Cast_SummonGoblinSkeleton()
{
    if(Npc_GetActiveSpellIsScroll(self))
    {
        self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
    }
    else
    {
        self.attribute[ATR_MANA] -= SPL_Cost_SummonGoblinSkeleton;
    };
    self.aivar[AIV_SelectSpell] += 1;
    if(Npc_IsPlayer(self))
    {
        if(C_HeroCanSummonImmortal())
        {
            Wld_SpawnNpcRange(self,Summoned_Gobbo_Skeleton_Immortal,1,500);
        }
        else
        {
            Wld_SpawnNpcRange(self,Summoned_Gobbo_Skeleton,1,500);
        };
    }
    else
    {
        Wld_SpawnNpcRange(self,Gobbo_Skeleton,1,500);
    };
};

func void Spell_Cast_SummonSkeleton()
{
    if(Npc_GetActiveSpellIsScroll(self))
    {
        self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
    }
    else
    {
        self.attribute[ATR_MANA] -= SPL_Cost_SummonSkeleton;
    };
    self.aivar[AIV_SelectSpell] += 1;
    if(Npc_IsPlayer(self))
    {
        if(C_HeroCanSummonImmortal())
        {
            Wld_SpawnNpcRange(self,Summoned_Skeleton_Immortal,1,500);
        }
        else
        {
            Wld_SpawnNpcRange(self,Summoned_Skeleton,1,500);
        };
    }
    else
    {
        Wld_SpawnNpcRange(self,Skeleton,1,500);
    };
};

func void Spell_Cast_SummonDemon()
{
    if(Npc_GetActiveSpellIsScroll(self))
    {
        self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
    }
    else
    {
        self.attribute[ATR_MANA] -= SPL_Cost_SummonDemon;
    };
    self.aivar[AIV_SelectSpell] += 1;
    if(Npc_IsPlayer(self))
    {
        if(C_HeroCanSummonImmortal())
        {
            Wld_SpawnNpcRange(self,Summoned_Demon_Immortal,1,500);
        }
        else
        {
            Wld_SpawnNpcRange(self,Summoned_Demon,1,500);
        };
    }
    else
    {
        Wld_SpawnNpcRange(self,Demon,1,500);
    };
};

func void Spell_Cast_SummonWolf()
{
    if(Npc_GetActiveSpellIsScroll(self))
    {
        self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
    }
    else
    {
        self.attribute[ATR_MANA] -= SPL_Cost_SummonWolf;
    };
    self.aivar[AIV_SelectSpell] += 1;
    if(Npc_IsPlayer(self))
    {
        if(C_HeroCanSummonImmortal())
        {
            Wld_SpawnNpcRange(self,Summoned_Wolf_Immortal,1,500);
        }
        else
        {
            Wld_SpawnNpcRange(self,Summoned_Wolf,1,500);
        };
    }
    else
    {
        Wld_SpawnNpcRange(self,Wolf,1,500);
    };
};

func void Spell_Cast_SummonGolem()
{
    if(Npc_GetActiveSpellIsScroll(self))
    {
        self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
    }
    else
    {
        self.attribute[ATR_MANA] -= SPL_Cost_SummonGolem;
    };
    self.aivar[AIV_SelectSpell] += 1;
    if(Npc_IsPlayer(self))
    {
        if(C_HeroCanSummonImmortal())
        {
            Wld_SpawnNpcRange(self,Summoned_Golem_Immortal,1,500);
        }
        else
        {
            Wld_SpawnNpcRange(self,Summoned_Golem,1,500);
        };
    }
    else
    {
        Wld_SpawnNpcRange(self,StoneGolem,1,500);
    };
};

func void Spell_Cast_SummonGuardian()
{
    if(Npc_GetActiveSpellIsScroll(self))
    {
        self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
    }
    else
    {
        self.attribute[ATR_MANA] -= SPL_Cost_SummonGuardian;
    };
    self.aivar[AIV_SelectSpell] += 1;
    if(Npc_IsPlayer(self))
    {
        if(C_HeroCanSummonImmortal())
        {
            Wld_SpawnNpcRange(self,Summoned_Guardian_Immortal,1,500);
        }
        else
        {
            Wld_SpawnNpcRange(self,Summoned_Guardian,1,500);
        };
    }
    else
    {
        Wld_SpawnNpcRange(self,StoneGuardian,1,500);
    };
};

func void Spell_Cast_SummonZombie()
{
    if(Npc_GetActiveSpellIsScroll(self))
    {
        self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
    }
    else
    {
        self.attribute[ATR_MANA] -= SPL_Cost_SummonZombie;
    };
    self.aivar[AIV_SelectSpell] += 1;
    if(Npc_IsPlayer(self))
    {
        if(C_HeroCanSummonImmortal())
        {
            Wld_SpawnNpcRange(self,Summoned_Zombie_Immortal,1,500);
        }
        else
        {
            Wld_SpawnNpcRange(self,Summoned_Zombie,1,500);
        };
    }
    else
    {
        Wld_SpawnNpcRange(self,Zombie01,1,500);
    };
};

func void Spell_Cast_ArmyofDarkness()
{
    if(Npc_GetActiveSpellIsScroll(self))
    {
        self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
    }
    else
    {
        self.attribute[ATR_MANA] -= SPL_Cost_ArmyofDarkness;
    };
    self.aivar[AIV_SelectSpell] += 1;
    if(Npc_IsPlayer(self))
    {
        if(C_HeroCanSummonImmortal())
        {
            Wld_SpawnNpcRange(self,Summoned_Skeleton_Immortal,6,800);
        }
        else
        {
            Wld_SpawnNpcRange(self,Summoned_Skeleton,6,800);
        };
    }
    else
    {
        Wld_SpawnNpcRange(self,Skeleton,6,800);
    };
};

/*func void Spell_Cast_SummonMud()
{
    if(Npc_GetActiveSpellIsScroll(self))
    {
        self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
    }
    else
    {
        self.attribute[ATR_MANA] -= SPL_Cost_SummonMud;
    };
    self.aivar[AIV_SelectSpell] += 1;
    if(Npc_IsPlayer(self))
    {
        if(C_HeroCanSummonImmortal())
        {
            Wld_SpawnNpcRange(self,Summoned_Mud_Immortal,1,500);
        }
        else
        {
            Wld_SpawnNpcRange(self,Summoned_Mud,1,500);
        };
    }
    else
    {
        Wld_SpawnNpcRange(self,Undead_Mud,1,500);
    };
};

test(ZS_MM_Rtn_Summoned_Loop)
{
    func int ZS_MM_Rtn_Summoned_Loop()
    {
        B_KillImmortalSummon(self);
        ZS_MM_Rtn_Summoned_Loop_Old();
    };
};

test(ZS_MM_Attack_Loop)
{
    func int ZS_MM_Attack_Loop()
    {
        B_KillImmortalSummon(self);
        ZS_MM_Attack_Loop_Old();
    };
};*/