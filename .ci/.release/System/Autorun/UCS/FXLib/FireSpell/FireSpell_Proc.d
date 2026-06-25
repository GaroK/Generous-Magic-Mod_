
func void processFireSpell(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID, var int spellLevel)
{
	if(damageType == DT_MAGIC)
	{
		if(isFireSpell(spellID))
		{
			startFireSpellFX(damageSender, damageReceiver, spellID, spellLevel);
		};
	};
	
	processAfterburn(damageSender, damageReceiver, damageType, spellID, spellLevel);
};