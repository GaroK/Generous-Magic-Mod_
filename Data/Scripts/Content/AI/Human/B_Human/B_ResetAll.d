// **********
// B_ResetAll
// **********

func void B_ResetAll(var C_Npc slf)
{
	// ------ NSC hÃƒÂ¶rt ggf. auf zu glotzen ------
	B_StopLookAt(slf);

	// ------ NSC steckt ggf. Waffe weg ------
	AI_RemoveWeapon(slf);
};
