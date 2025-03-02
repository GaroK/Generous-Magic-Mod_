// *************
// SPL_FireStorm ALIAS INSTANTFIRESTORM
// *************

const int SPL_Cost_InstantFireStorm = 25;
const int SPL_Damage_InstantFireStorm = 100;

instance Spell_Firestorm(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_InstantFireStorm;
	damageType = DAM_MAGIC; // war vorher DAM_FIRE fÃƒÂ¼r feuereffekte
};

func int Spell_Logic_Firestorm(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= C_CheckManaCost(self,SPL_Cost_InstantFireStorm))
	{
		return SPL_SENDCAST;
	}
	else // nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Firestorm()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - C_CheckManaCost(self,SPL_Cost_InstantFireStorm);
	};

	self.aivar[AIV_SelectSpell] += 1;
};
