// ***********
// SPL_Picklock
// ***********

const int SPL_COST_Picklock = 10;

func int C_CanUnlockFocusVob(var C_NPC npc)
{
	return FALSE;
};

func void B_UnlockFocusVob(var C_NPC npc)
{
};

instance Spell_Picklock(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = 1; //SPELL_NEUTRAL
	canTurnDuringInvest = 0;
	canChangeTargetDuringInvest = 0;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectType = TARGET_TYPE_ALL;
	targetCollectRange = 1000;
};

func int Spell_Logic_Picklock(var int manaInvested)
{
	if(!C_CanUnlockFocusVob(self))
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	};
	if(self.attribute[ATR_MANA] >= C_CheckManaCost(self,SPL_COST_Picklock))
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void Spell_Cast_Picklock()
{
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= C_CheckManaCost(self,SPL_COST_Picklock);
	};
	if(C_CanUnlockFocusVob(self))
	{
		B_UnlockFocusVob(self);
	};
	self.aivar[AIV_SelectSpell] += 1;
};
