
func int isFireSpell(var int spellID)
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