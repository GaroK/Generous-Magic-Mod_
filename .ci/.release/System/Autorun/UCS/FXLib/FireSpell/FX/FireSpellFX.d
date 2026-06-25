
func int GetFireSpellFXDamage(var int spellID, var int spellLevel)
{
	if(spellID == SPL_Firebolt){ return 0; };
	if(spellID == SPL_InstantFireball){ return 0; };
	if(spellID == SPL_ChargeFireball){ return 0; };
	if(spellID == SPL_Firestorm){ return 0; };
	if(spellID == SPL_Deathbolt){ return 0; };
	if(spellID == SPL_Deathball){ return 0; };
	if(spellID == SPL_Pyrokinesis){ return SwitchBySpellLevel(spellLevel, 75, 150, 225, 300); };
	if(spellID == SPL_Firerain){ return 0; };
	
	return 0;
};

const int FireSpellFX_DT = DT_MAGIC;
const int FireSpellFX_SpellID = -1;
const int FireSpellFX_SpellLevel = -1;
const string FireSpellFX_VFX = "";
const int FireSpellFX_DontKill = 0;

func int GetFireSpellFXArea(var int spellID, var int spellLevel) // inclusion area radius
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

func int FireSpellFX_IncludeCnd() // include in area condition
{
	// fxID - fx instance
	// self - damage receiver
	// other - damage sender
	// victim - central damage receiver
	
	if(!Npc_GetDistToNpc(self, victim))
	{
		return false;
	};
	
	return true;
};

func void startFireSpellFX(var C_NPC damageSender, var C_NPC damageReceiver, var int spellID, var int spellLevel)
{
	var int fireSpellFX_Damage; fireSpellFX_Damage = GetFireSpellFXDamage(spellID, spellLevel);
	var int fireSpellFX_Area; fireSpellFX_Area = GetFireSpellFXArea(spellID, spellLevel);
	
	if(fireSpellFX_Area > 0)
	{
		UCS_AreaHit(fireSpellFX_Area, FireSpellFX_IncludeCnd, damageSender, damageReceiver, fireSpellFX_Damage, FireSpellFX_DT, FireSpellFX_SpellID, FireSpellFX_SpellLevel, FireSpellFX_VFX, FireSpellFX_DontKill);
	}
	else
	{
		UCS_Hit(damageSender, damageReceiver, fireSpellFX_Damage, FireSpellFX_DT, FireSpellFX_SpellID, FireSpellFX_SpellLevel, FireSpellFX_VFX, FireSpellFX_DontKill);
	};
};