
func int GetAfterburnFXDamage(var int spellID, var int spellLevel)
{
	if(spellID == SPL_Firebolt){ return 2; };
	if(spellID == SPL_InstantFireball){ return 3; };
	if(spellID == SPL_ChargeFireball){ return 5; };
	if(spellID == SPL_Firestorm){ return 5; };
	if(spellID == SPL_Deathbolt){ return 5; };
	if(spellID == SPL_Deathball){ return 5; };
	if(spellID == SPL_Pyrokinesis){ return SwitchBySpellLevel(spellLevel, 5, 10, 15, 20); };
	if(spellID == SPL_Firerain){ return 10; };
	
	return 0;
};

const int AfterburnFX_DT = DT_FALL;
const int AfterburnFX_SpellID = -1;
const int AfterburnFX_SpellLevel = -1;
const string AfterburnFX_VFX = "";
const int AfterburnFX_DontKill = 0;
const float AfterburnFX_LoopInterval = 1000.0;
const int AfterburnFX_IterCount = 5;
const float AfterburnFX_StartDelay = 1000.0;

func int AfterburnFX_ExitCnd(var int fxID) // exit condition
{
	if(C_BodyStateContains(self, BS_SWIM))
	{
		return true;
	};
	if(C_BodyStateContains(self, BS_DIVE))
	{
		return true;
	};
	
	return false;
};

func int GetAfterburnFXArea(var int spellID, var int spellLevel) // inclusion area radius
{
	if(spellID == SPL_Firebolt){ return 0; };
	if(spellID == SPL_InstantFireball){ return 0; };
	if(spellID == SPL_ChargeFireball){ return 0; };
	if(spellID == SPL_Firestorm){ return 0; };
	if(spellID == SPL_Deathbolt){ return 0; };
	if(spellID == SPL_Deathball){ return 0; };
	if(spellID == SPL_Pyrokinesis){ return SwitchBySpellLevel(spellLevel, 0, 300, 1000, 2000); };
	if(spellID == SPL_Firerain){ return 0; };
	
	return 0;
};

func int AfterburnFX_IncludeCnd() // include in area condition
{
	// fxID - fx instance
	// self - damage receiver
	// other - damage sender
	
	return true;
};

var int afterburnFX; // FX INSTANCE

func void startAfterburnFX(var C_NPC damageSender, var C_NPC damageReceiver, var int spellID, var int spellLevel)
{
	var int afterburnFX_Damage; afterburnFX_Damage = GetAfterburnFXDamage(spellID, spellLevel);
	var int afterburnFX_Area; afterburnFX_Area = GetAfterburnFXArea(spellID, spellLevel);
	
	if(afterburnFX_Area > 0)
	{
		UCS_RestartAreaFX(afterburnFX, afterburnFX_Area, AfterburnFX_IncludeCnd, damageSender, damageReceiver, afterburnFX_Damage, AfterburnFX_DT, AfterburnFX_SpellID, AfterburnFX_SpellLevel, AfterburnFX_VFX, AfterburnFX_DontKill, AfterburnFX_LoopInterval, AfterburnFX_IterCount, AfterburnFX_StartDelay, AfterburnFX_ExitCnd);
	}
	else
	{
		UCS_RestartFX(afterburnFX, damageSender, damageReceiver, afterburnFX_Damage, AfterburnFX_DT, AfterburnFX_SpellID, AfterburnFX_SpellLevel, AfterburnFX_VFX, AfterburnFX_DontKill, AfterburnFX_LoopInterval, AfterburnFX_IterCount, AfterburnFX_StartDelay, AfterburnFX_ExitCnd);
	};
};

func void modifyAfterburnFX(var C_NPC damageSender, var C_NPC damageReceiver)
{
	if(UCS_IsApplying(afterburnFX, damageSender, damageReceiver))
	{
		
	};
};

func void stopAfterburnFX(var C_NPC damageSender, var C_NPC damageReceiver)
{
	
};