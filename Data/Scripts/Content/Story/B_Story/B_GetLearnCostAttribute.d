// ***********************************************************
// B_GetLearnCostAttribute
// -----------------------
// ermittelt die Kosten eines Attributspunktes (abh. v. Gilde)
// ***********************************************************

func int B_GetLearnCostAttribute(var C_Npc oth, var int attribut)
{
	var int kosten; kosten = 0;

	// ------ Kosten fÃƒÂ¼r StÃƒÂ¤rke ------
	if (attribut == ATR_STRENGTH)
	{
		if (oth.aivar[REAL_STRENGTH] >= 120) { kosten = (5); }

		else if (oth.aivar[REAL_STRENGTH] >= 90) { kosten = (4); }
		else if (oth.aivar[REAL_STRENGTH] >= 60) { kosten = (3); }
		else if (oth.aivar[REAL_STRENGTH] >= 30) { kosten = (2); }
		else { kosten = (1); };
	};

	// ------ Kosten fÃƒÂ¼r Dexterity ------
	if (attribut == ATR_DEXTERITY)
	{
		if (oth.aivar[REAL_DEXTERITY] >= 120) { kosten = (5); }

		else if (oth.aivar[REAL_DEXTERITY] >= 90) { kosten = (4); }
		else if (oth.aivar[REAL_DEXTERITY] >= 60) { kosten = (3); }
		else if (oth.aivar[REAL_DEXTERITY] >= 30) { kosten = (2); }
		else { kosten = (1); };
	};

	// ------ Kosten fÃƒÂ¼r Mana MAX ------
	if (attribut == ATR_MANA_MAX)
	{
		if (oth.aivar[REAL_MANA_MAX] >= 300) { kosten = (5); }

		else if (oth.aivar[REAL_MANA_MAX] >= 225) { kosten = (4); }
		else if (oth.aivar[REAL_MANA_MAX] >= 150) { kosten = (3); }
		else if (oth.aivar[REAL_MANA_MAX] >= 75) { kosten = (2); }
		else { kosten = (1); };
	};

	return kosten;
};
