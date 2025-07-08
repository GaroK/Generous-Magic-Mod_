/*const int SPL_COST_Picklock = 10;

instance Spell_Picklock(C_Spell_Proto)
{
    time_per_mana = 0;
    spellType = SPELL_NEUTRAL;
    targetCollectRange = 1000;
    targetCollectType = TARGET_TYPE_ALL;
    targetCollectAlgo = TARGET_COLLECT_FOCUS;
};


func int Spell_Logic_Picklock(var int manaInvested)
{
    if(Hlp_IsFocusMobLocked(self) == 0){
        Hlp_PrintDebug("Not locked");
        return SPL_SENDSTOP;
    };
    if(Hlp_IsFocusMobLockedWithKey(self)){
        Hlp_PrintDebug("Locked with key");
        if(Npc_IsPlayer(self))
        {
            Print(PRINT_KeyMissing);
        };
        AI_PlayAni(self,"T_DONTKNOW");
        B_Say_Overlay(self,self,"$KEYMISSING");
        return SPL_SENDSTOP;
    };
    if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
    {
        return SPL_SENDCAST;
    };
    return SPL_SENDSTOP;
};

func void Spell_Cast_Picklock()
{
    if(Npc_GetActiveSpellIsScroll(self))
    {
        self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
    }
    else
    {
        self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_Picklock;
    };
    if(Hlp_HasFocusVob(self)){
        Hlp_PrintDebug("Got focus");
        Mob_SetFocusUnlocked(self);
        // Snd_Play3d(self,"PICKLOCK_UNLOCK");
        Snd_Play("DOOR_UNLOCK_MOD");
        Npc_SendPassivePerc(self, PERC_ASSESSUSEMOB, self, self);
    };
    self.aivar[AIV_SelectSpell] += 1;
};*/