// ******************
// C_NpcIsMonsterMage
// ******************

func int C_NpcIsMonsterMage(var C_Npc slf)
{
	if ((slf.guild == GIL_SKELETON_MAGE)
	|| (slf.guild == GIL_FIREGOLEM)
	|| (slf.guild == GIL_ICEGOLEM)
	|| (slf.guild == GIL_DRAGON))
	//	|| (slf.guild == GIL_ORC) // fÃƒÂ¼r Orc-Shaman genauere Eingrenzung (in Ork-AI, nicht hier)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
