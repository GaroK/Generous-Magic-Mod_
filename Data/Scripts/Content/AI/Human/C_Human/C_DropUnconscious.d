// **************************************************************
// C_DropUnconscious
// -----------------
// self und other hier vom Programm initialisiert:
// self ist immer der NPC, fÃƒÂ¼r den diese Funktion den Check macht
// other ist immer der TÃƒÂ¤ter (der den Treffer gelandet hat)
// **************************************************************

func int C_DropUnconscious()
{
	// if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Raven))
	// || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Raven))
	// {
	//	return TRUE;
	// };

	// ------ Folgende NSCs tÃƒÂ¶ten immer ------
	if ((other.guild > GIL_SEPERATOR_HUM)
	|| (other.guild == GIL_DMT)
	|| (other.guild == GIL_BDT)
	|| (other.aivar[AIV_DropDeadAndKill] == TRUE))
	{
		return FALSE;
	};

	// ------ nur echte Humans kÃƒÂ¶nnen Unconscious werden ------
	if (self.guild < GIL_SEPERATOR_HUM)
	{
		if ((self.guild != GIL_DMT)
		&& (self.guild != GIL_BDT)
		&& (self.aivar[AIV_DropDeadAndKill] == FALSE))
		{
			return TRUE;
		};
	};

	return FALSE;
};
