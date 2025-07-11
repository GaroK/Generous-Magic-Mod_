// ******************
// SPL_Geyser K3
// ******************

const int SPL_Cost_Geyser 	= 35;
const int SPL_Damage_Geyser = 120;

instance Spell_Geyser(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_Geyser;
	damageType = DAM_MAGIC;
};

func int Spell_Logic_Geyser(var int manaInvested) // Parameter wird hier nicht gebraucht
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= C_CheckManaCost(self,SPL_Cost_Geyser))
	{
		return SPL_SENDCAST;
	}
	else // nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Geyser()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - C_CheckManaCost(self,SPL_Cost_Geyser);
	};

	self.aivar[AIV_SelectSpell] += 1;
};
