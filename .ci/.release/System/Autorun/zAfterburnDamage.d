//apply X damage every Y milliseconds Z times
var int Afterburn_Damage; //X
const int Afterburn_Interval = 1000; //Y
const int Afterburn_Ticks = 5; //Z

const int AIV_StateBurning = 92;

func int B_ApplyAfterburnDamage()
{
	if(self.attribute[ATR_HITPOINTS] <= Afterburn_Damage + 1)
	{
		self.aivar[AIV_StateBurning] = 0;
		return LOOP_END;
	};
	if(self.aivar[AIV_StateBurning] >= Afterburn_Ticks + 1)
	{
		self.aivar[AIV_StateBurning] = 0;
		return LOOP_END;
	};
	if(C_BodyStateContains(self,BS_SWIM))
	{
		self.aivar[AIV_StateBurning] = 0;
		return LOOP_END;
	};
	if(C_BodyStateContains(self,BS_DIVE))
	{
		self.aivar[AIV_StateBurning] = 0;
		return LOOP_END;
	};
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-Afterburn_Damage);
	self.aivar[AIV_StateBurning] += 1;
	return LOOP_CONTINUE;
};

func void B_StartAfterburn(var int damage)
{
	if(self.aivar[AIV_StateBurning] == 0)
	{
		Afterburn_Damage = damage;
		AI_StartTriggerScriptEx("B_ApplyAfterburnDamage",Afterburn_Interval,self,other,victim);
	};
	self.aivar[AIV_StateBurning] = 1;
};

func int C_CanNpcCollideWithSpell(var int spellType)
{
	if(spellType == SPL_Firebolt)
	{
		B_StartAfterburn(2);
	};
	if(spellType == SPL_InstantFireball)
	{
		B_StartAfterburn(3);
	};
	if(spellType == SPL_ChargeFireball)
	{
		B_StartAfterburn(5);
	};
	if(spellType == SPL_Firestorm)
	{
		B_StartAfterburn(5);
	};
	if(spellType == SPL_Deathbolt)
	{
		B_StartAfterburn(5);
	};
	if(spellType == SPL_Deathball)
	{
		B_StartAfterburn(5);
	};
	if(spellType == SPL_Pyrokinesis)
	{
		B_StartAfterburn(10);
	};
	if(spellType == SPL_Firerain)
	{
		B_StartAfterburn(10);
	};
	C_CanNpcCollideWithSpell_Old(spellType);
};
