// ******************************************************
// B_CreateAmmo
// ------------
// generiert Munition, wenn FK-Waffe equippt oder gezogen
// ******************************************************

func void B_CreateAmmo(var C_Npc slf)
{
	var C_ITEM rangedWeapon;

	if (Npc_IsInFightMode(slf, FMODE_FAR))
	{
		rangedWeapon = Npc_GetReadiedWeapon(slf);
	}
	else if (Npc_HasEquippedRangedWeapon(slf))
	{
		rangedWeapon = Npc_GetEquippedRangedWeapon(slf);
	}
	else // weder gezogenen noch equippten Bogen
	{
		return;
	};

	// ------ Munition auffÃƒÂ¼llen ------
	if (rangedWeapon.munition == ItRw_Arrow)
	{
		if (Npc_HasItems(slf, ItRw_Arrow) < 10)
		{
			CreateInvItems(slf, ItRw_Arrow, 10);
		};
	}
	else if (rangedWeapon.munition == ItRw_Bolt)
	{
		if (Npc_HasItems(slf, ItRw_Bolt) < 10)
		{
			CreateInvItems(slf, ItRw_Bolt, 10);
		};
	};
};
