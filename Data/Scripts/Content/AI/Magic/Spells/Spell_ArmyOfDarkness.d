// ******************
// SPL_ArmyOfDarkness
// ******************

const int SPL_Cost_ArmyOfDarkness	= 300;


INSTANCE Spell_ArmyOfDarkness (C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int C_CheckManaCost(var C_Npc npc,var int cost)
{
	var C_Item EquipWeap;
	if(Npc_HasEquippedMeleeWeapon(npc))
	{
		EquipWeap = Npc_GetEquippedMeleeWeapon(npc);
		if(Hlp_IsItem(EquipWeap,ItMW_GMM_Stab_03_Eff_V1))
		{
			return (cost * 85) / 100;
		};
		
		if(Hlp_IsItem(EquipWeap,ItMW_GMM_Stab_03_Eff_V2))
		{
			return (cost * 75) / 100;
		};
		
		if(Hlp_IsItem(EquipWeap,ItMW_GMM_Stab_03_Eff_V3))
		{
			return (cost * 65) / 100;
		};
	};
	return cost;
};

func int Spell_Logic_ArmyOfDarkness(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= C_CheckManaCost(self,SPL_Cost_ArmyOfDarkness))
	{
		return SPL_SENDCAST;
	}
	else // nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

// NEU:
// einige Spells haben Probleme logische Aktionen mit den Animationen
// zu synchronisieren. In diesem Beispiel wÃƒÂ¼rden, wenn die folgenden Befehle
// direkt vor dem SPL_SENDCAST stÃƒÂ¼nden, die Skelette gespawned werden, bevor
// ÃƒÂ¼berhaupt eine Investier- oder Cast- Ani angespielt ist.
// Darum gibt es ab Version 1.16b optional die MÃƒÂ¶glichkeit, etwaige Aktionen
// mit den Anis zu synchronisieren. DafÃƒÂ¼r muss dann eine SkriptFunktion
// Spell_Cast_SPELLNAME existieren, die aufgerufen wird, sobald alle Magie Animationen
// beendet wurden
func void Spell_Cast_ArmyOfDarkness(var int spellLevel)
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = 0; // kostet alles, mindestens 250
//		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - C_CheckManaCost(self,SPL_Cost_ArmyOfDarkness);
	};
	
	

	if (Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self, Summoned_Skeleton, 4, 800);
		Wld_SpawnNpcRange(self, Summoned_Gobbo_Skeleton, 3, 800);
		Wld_SpawnNpcRange(self, Summoned_Zombie, 1, 800);
				  if (HeroHasEquippedSpecialStaff_V2)
		{
        Wld_SpawnNpcRange(self, SUMMONED_GOBBO_SKELETON, 1, 500); //or any other instance
		Wld_SpawnNpcRange(self, Summoned_Skeleton, 1, 800);
		Wld_SpawnNpcRange(self, Summoned_Zombie, 1, 800);
		};
						  if (HeroHasEquippedSpecialStaff_V3)
		{
        Wld_SpawnNpcRange(self, SUMMONED_GOBBO_SKELETON, 1, 500); //or any other instance
		Wld_SpawnNpcRange(self, Summoned_Skeleton, 1, 800);
		Wld_SpawnNpcRange(self, Summoned_Zombie, 1, 800);
		Wld_SpawnNpcRange(self, Summoned_Demon, 1, 1000);
		};
		
	}
	else
	{
		Wld_SpawnNpcRange(self, Skeleton, 6, 800);
	};
	

	self.aivar[AIV_SelectSpell] += 1;
};
