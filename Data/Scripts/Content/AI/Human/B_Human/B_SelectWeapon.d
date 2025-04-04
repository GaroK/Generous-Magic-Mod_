// *******************************************
// B_SelectWeapon
// --------------
// Bei FernkÃƒÂ¤mpfern wird Muni ins Inv gemogelt
// *******************************************

func void B_SelectWeapon(var C_Npc slf, var C_Npc oth)
{
	// EXIT if...

	// ------ NSC im Wasser / beim Fallen ------
	if ((C_BodyStateContains(slf, BS_FALL))
	|| (C_BodyStateContains(slf, BS_SWIM))
	|| (C_BodyStateContains(slf, BS_DIVE)))
	{
		return;
	};

	// ------ Magie wÃƒÂ¤hlen oder behalten ------
	if (B_SelectSpell(slf, oth)) // bei HUMANS wÃƒÂ¤hlen nur Magier, Paladine oder Dementoren Magie
	{
		return; // Magie gewÃƒÂ¤hlt!
	};

	if (Npc_IsInFightMode(slf, FMODE_MAGIC)) // Habe Magie gezogen, will aber keine benutzen!!!
	{
		if (!Npc_IsInFightMode(slf, FMODE_NONE)) // irgendeine ANDERE Waffe gezogen
		{
			AI_RemoveWeapon(slf);
		};

		AI_ReadyMeleeWeapon(slf); // Schwert ziehen, sonst FÃƒÂ¤uste
		return;
	};

	// ------ Fernkampfwaffe behalten ------
	if (Npc_IsInFightMode(slf, FMODE_FAR))
	{
		if ((Npc_GetDistToNpc(slf, oth) > FIGHT_DIST_RANGED_INNER)
		|| (!Npc_HasEquippedMeleeWeapon(slf)))
		{
			return;
		};
	};

	// ------ Nahkampfwaffe behalten ------
	if (Npc_IsInFightMode(slf, FMODE_MELEE))
	{
		if ((Npc_GetDistToNpc(slf, oth) <= FIGHT_DIST_RANGED_OUTER)
		|| (!Npc_HasEquippedRangedWeapon(slf)))
		{
			return;
		};
	};

	// FUNC

	// ------ NK-Waffe ziehen ------
	if ((Npc_HasEquippedMeleeWeapon(slf))
	&& (Npc_GetDistToNpc(slf, oth) <= FIGHT_DIST_RANGED_OUTER))
	{
		if (!Npc_IsInFightMode(slf, FMODE_NONE)) // irgendeine ANDERE Waffe gezogen
		{
			AI_RemoveWeapon(slf);
		};

		AI_ReadyMeleeWeapon(slf); // Schwert ziehen, sonst FÃƒÂ¤uste
		return;
	};

	// ------ Bogen ziehen ------
	if ((Npc_HasEquippedRangedWeapon(slf))
	&& (Npc_GetDistToNpc(slf, oth) > FIGHT_DIST_RANGED_INNER)
	&& (C_NpcHasAttackReasonToKill(slf)))
	{
		if (!Npc_IsInFightMode(slf, FMODE_NONE)) // irgendeine ANDERE Waffe gezogen
		{
			AI_RemoveWeapon(slf);
		};

		AI_ReadyRangedWeapon(slf); // FK-Waffe ziehen
		return;
	};

	// ------ immer noch keine Waffe ------
	if (Npc_IsInFightMode(slf, FMODE_NONE))
	{
		// ------ dann Schwert, egal welche Distanz ------
		if (Npc_HasEquippedMeleeWeapon(slf))
		{
			AI_ReadyMeleeWeapon(slf); // Schwert ziehen
			return;
		};

		// ------ wenn kein Schwert, dann Bogen, egal welche Distanz ------
		if (Npc_HasEquippedRangedWeapon(slf))
		{
			AI_ReadyRangedWeapon(slf); // FK-Waffe ziehen
			return;
		};

		// ----- wenn gar keine Waffe: Default (FÃƒÂ¤uste) ------
		AI_ReadyMeleeWeapon(slf);
		return;
	};

	return;
};
