// ************************
// SPL_SummonGoblinSkeleton
// ************************

const int SPL_Cost_SummonGoblinSkeleton = 20;

instance Spell_SummonGoblinSkeleton(C_Spell_Proto) // ehem. Spell_Skeleton
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonGoblinSkeleton(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= C_CheckManaCost(self,SPL_Cost_SummonGoblinSkeleton))
	{
		return SPL_SENDCAST;
	}
	else // nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonGoblinSkeleton()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - C_CheckManaCost(self,SPL_Cost_SummonGoblinSkeleton);
	};

	if (Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self, SUMMONED_GOBBO_SKELETON, 1, 500);
		  if (HeroHasEquippedSpecialStaff_V2)
		{
        Wld_SpawnNpcRange(self, SUMMONED_GOBBO_SKELETON, 1, 500); //or any other instance
		};
				  if (HeroHasEquippedSpecialStaff_V3)
		{
        Wld_SpawnNpcRange(self, SUMMONED_GOBBO_SKELETON, 1, 500); //or any other instance
		Wld_SpawnNpcRange(self, SUMMONED_GOBBO_SKELETON, 1, 500);
		};
		
	}
	else
	{
		Wld_SpawnNpcRange(self, GOBBO_SKELETON, 1, 500);
	};

	self.aivar[AIV_SelectSpell] += 1;
};