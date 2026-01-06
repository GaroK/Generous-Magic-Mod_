// *******************
// SPL_FrostBite
// *******************

const int SPL_Cost_FrostBite = 15;
const int SPL_Damage_FrostBite = 180;

instance Spell_FrostBite(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_FrostBite;
	damageType = DAM_MAGIC; // war vorher DAM_FIRE
};

func int Spell_Logic_FrostBite(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >=  C_CheckManaCost(self,SPL_Cost_FrostBite))
	{
		return SPL_SENDCAST;
	}
	else // nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_FrostBite()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] -  C_CheckManaCost(self,SPL_Cost_FrostBite);	
	};

	self.aivar[AIV_SelectSpell] += 1;
};
