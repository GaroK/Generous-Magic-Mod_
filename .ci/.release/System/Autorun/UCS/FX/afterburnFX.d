
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

const int afterburnFX_DT = DT_FALL;
const int afterburnFX_SpellID = -1;
const int afterburnFX_SpellLevel = -1;
const string afterburnFX_VFX = "";
const int afterburnFX_DontKill = 0;
const float afterburnFX_LoopInterval = 1000.0;
const int afterburnFX_IterCount = 5;
const float afterburnFX_StartDelay = 1000.0;

func int afterburnFX_ExitCnd(var int fxID) // exit condition
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
	if(spellID == SPL_Pyrokinesis){ return SwitchBySpellLevel(spellLevel, 0, 100, 300, 500); };
	if(spellID == SPL_Firerain){ return 0; };
	
	return 0;
};

func int afterburnFX_IncludeCnd(var int fxID) // include in area condition
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
	
	Print(IntToString(spellLevel));
	
	UCS_RestartAreaFXEX(afterburnFX, afterburnFX_Area, afterburnFX_IncludeCnd, damageSender, damageReceiver, afterburnFX_Damage, afterburnFX_DT, afterburnFX_SpellID, afterburnFX_SpellLevel, afterburnFX_VFX, afterburnFX_DontKill, afterburnFX_LoopInterval, afterburnFX_IterCount, afterburnFX_StartDelay, afterburnFX_ExitCnd);
};

func void modifyAfterburnFX(var C_NPC damageSender, var C_NPC damageReceiver)
{
	
};

func void stopAfterburnFX(var C_NPC damageSender, var C_NPC damageReceiver)
{
	
};

func int isAfterburnFXSpell(var int spellID)
{
	if(spellID == SPL_Firebolt){ return true; };
	if(spellID == SPL_InstantFireball){ return true; };
	if(spellID == SPL_ChargeFireball){ return true; };
	if(spellID == SPL_Firestorm){ return true; };
	if(spellID == SPL_Deathbolt){ return true; };
	if(spellID == SPL_Deathball){ return true; };
	if(spellID == SPL_Pyrokinesis){ return true; };
	if(spellID == SPL_Firerain){ return true; };
	
	return false;
};

func void processAfterburnFX(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID, var int spellLevel)
{
	if(damageType == DT_MAGIC && isAfterburnFXSpell(spellID) && !Npc_IsPlayer(damageReceiver))
	{
		startAfterburnFX(damageSender, damageReceiver, spellID, spellLevel);
	};
	
	if(UCS_IsApplying(afterburnFX, damageSender, damageReceiver))
	{
		modifyAfterburnFX(damageSender, damageReceiver);
	};
};