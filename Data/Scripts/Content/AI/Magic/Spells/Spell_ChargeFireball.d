// ******************
// SPL_ChargeFireball
// ******************

const int SPL_Cost_ChargeFireball = 160; // 4*40
const int STEP_ChargeFireball = 40;
const int SPL_Damage_ChargeFireball = 75;

instance Spell_ChargeFireball(C_Spell_Proto)
{
	time_per_mana = 30;
	damage_per_level = SPL_Damage_ChargeFireball;
	damageType = DAM_MAGIC;
	canTurnDuringInvest = TRUE;
};

func int Spell_Logic_ChargeFireball(var int manaInvested)
{
	if (self.attribute[ATR_MANA]<C_CheckManaCost(self,C_CheckManaCost(self,STEP_ChargeFireball)))
	{
		return SPL_DONTINVEST;
	};

	if (manaInvested <= C_CheckManaCost(self,C_CheckManaCost(self,STEP_ChargeFireball)*1))
	{
		self.aivar[AIV_SpellLevel] = 1; // Start mit Level 1
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if (manaInvested > (C_CheckManaCost(self,C_CheckManaCost(self,STEP_ChargeFireball)*1))
	&& (self.aivar[AIV_SpellLevel] <= 1))
	{
		self.attribute[ATR_MANA] = (self.attribute[ATR_MANA] - C_CheckManaCost(self,C_CheckManaCost(self,STEP_ChargeFireball)));

		if (self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};

		self.aivar[AIV_SpellLevel] = 2;
		return SPL_NEXTLEVEL; // Lev2 erreicht
	}
	else if (manaInvested > (C_CheckManaCost(self,C_CheckManaCost(self,STEP_ChargeFireball)*2)))
	&& (self.aivar[AIV_SpellLevel] <= 2)
	{
		self.attribute[ATR_MANA] = (self.attribute[ATR_MANA] - C_CheckManaCost(self,C_CheckManaCost(self,STEP_ChargeFireball)));

		if (self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};

		self.aivar[AIV_SpellLevel] = 3;
		return SPL_NEXTLEVEL; // Lev3 erreicht
	}
	else if (manaInvested > (C_CheckManaCost(self,C_CheckManaCost(self,STEP_ChargeFireball)*3)))
	&& (self.aivar[AIV_SpellLevel] <= 3)
	{
		self.attribute[ATR_MANA] = (self.attribute[ATR_MANA] - C_CheckManaCost(self,C_CheckManaCost(self,STEP_ChargeFireball)));

		if (self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};

		self.aivar[AIV_SpellLevel] = 4;
		return SPL_NEXTLEVEL; // Lev4 erreicht
	}
	else if (manaInvested > (C_CheckManaCost(self,C_CheckManaCost(self,STEP_ChargeFireball)*3)))
	&& (self.aivar[AIV_SpellLevel] == 4)
	{
		return SPL_DONTINVEST;
	};

	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void Spell_Cast_ChargeFireball(var int spellLevel)
{
    Npc_ChangeAttribute(self,ATR_MANA,-C_CheckManaCost(self,STEP_ChargeFireball));
	self.aivar[AIV_SelectSpell] += 1;
};
