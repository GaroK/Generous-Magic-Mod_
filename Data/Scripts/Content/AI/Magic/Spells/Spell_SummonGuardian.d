// ******************
// SPL_SummonGuardian /k3
// ******************

const int SPL_Cost_SummonGuardian = 60;

instance Spell_SummonGuardian(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonGuardian(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= C_CheckManaCost(self,SPL_Cost_SummonGuardian))
	{
		return SPL_SENDCAST;
	}
	else // nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonGuardian()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - C_CheckManaCost(self,SPL_Cost_SummonGuardian);
	};

	self.aivar[AIV_SelectSpell] = (self.aivar[AIV_SelectSpell] + 1);

	if (Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self, Summoned_Guardian, 1, 500);
			 if (HeroHasEquippedSpecialStaff_V2)
		{
        Wld_SpawnNpcRange(self, SUMMONED_GOBBO_SKELETON, 1, 500); //or any other instance
		};
					 if (HeroHasEquippedSpecialStaff_V3)
		{
        Wld_SpawnNpcRange(self, SUMMONED_GOBBO_SKELETON, 1, 500); //or any other instance
		Wld_SpawnNpcRange(self, Summoned_Guardian, 1, 500);
		};
		
	}
	else
	{
		Wld_SpawnNpcRange(self, Stoneguardian, 1, 500);
	};

	self.aivar[AIV_SelectSpell] += 1;
};
