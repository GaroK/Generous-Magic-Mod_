
func void processAfterburn(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID, var int spellLevel)
{
	//modifyAfterburnFX(damageSender, damageReceiver);
	
	if(damageType == DT_MAGIC)
	{
		if(isFireSpell(spellID))
		{
			startAfterburnFX(damageSender, damageReceiver, spellID, spellLevel);
		};
	};
};